class WebTermController extends AppController

  constructor: (options = {}, data) ->

    options.view     = new WebTermView
    options.cssClass = "webterm"

    super options, data

  bringToFront: ->

    data = new WebTermView

    options =
      name         : "Terminal"
      hiddenHandle : no
      type         : "application"
      cssClass     : "webterm"

    @propagateEvent
      KDEventType  : "ApplicationWantsToBeShown"
      globalEvent  : yes
    , {options, data}

WebTerm = {}
