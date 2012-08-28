nodePath = require 'path'

module.exports =
  name    : "terminaljs"
  port    : 4567
  pidPath : "/var/run/node/TerminalJS.pid"
  logFile : "/var/log/node/TerminalJS.log"
  amqp              :
    host            : 'web0.beta.system.aws.koding.com'
    username        : 'guest'
    password        : 'x1srTA7!%Vb}$n|S'
    # username        : 'guest'
    # password        : 'x1srTA7!%Vb}$n|S'
  # pusher  :
  #   appId : 22120
  #   key   : 'a6f121a130a44c7f5325'
  #   secret: '9a2f248630abaf977547'
  # apiUri  : 'https://dev-api.koding.com/1.0'
  
  requestHandler :
    isEnabled    : yes
    joinedChannelsDir : nodePath.join( __dirname, '.tmp/joined-channels/' )
