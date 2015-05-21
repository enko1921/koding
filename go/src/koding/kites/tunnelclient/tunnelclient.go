package main

import (
	"errors"
	"fmt"
	"os"

	"github.com/koding/kite"
	"github.com/koding/kite/protocol"
	"github.com/koding/multiconfig"
	"github.com/koding/streamtunnel"
)

type registerResult struct {
	VirtualHost string
	Identifier  string
}

type config struct {
	ServerAddr string `default:"127.0.0.1:4444"`
	LocalAddr  string
}

func main() {
	conf := new(config)
	multiconfig.New().MustLoad(conf)

	k := kite.New("tunnelclient", "0.0.1")
	go k.Run()
	<-k.ServerReadyNotify()

	tunnelserver := k.NewClient("http://" + conf.ServerAddr + "/kite")
	if err := tunnelserver.Dial(); err != nil {
		k.Log.Error(err.Error())
		return
	}

	result, err := callRegister(tunnelserver)
	if err != nil {
		fmt.Println(err)
		return
	}

	k.Log.Info("Our tunnel public host is: '%s'", result.VirtualHost)
	client := streamtunnel.NewClient(conf.ServerAddr, conf.LocalAddr)
	if err := client.Start(result.Identifier); err != nil {
		fmt.Fprintf(os.Stderr, err.Error())
	}
}

func callRegister(tunnelserver *kite.Client) (*registerResult, error) {
	response, err := tunnelserver.Tell("register", nil)
	if err != nil {
		return nil, err
	}

	result := &registerResult{}
	err = response.Unmarshal(result)
	if err != nil {
		return nil, err
	}

	return result, nil
}

func getTunnelServer(k *kite.Kite) (*kite.Client, error) {
	query := &protocol.KontrolQuery{
		Username:    "arslan",
		Environment: "development",
		Name:        "tunnelserver",
	}

	kites, err := k.GetKites(query)
	if err != nil {
		return nil, err
	}

	if len(kites) == 0 {
		return nil, errors.New("no tunnelserver available")
	}

	return kites[0], nil
}
