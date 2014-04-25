class PricingCustomQuoteView extends KDView
  constructor: (options = {}, data) ->
    options.tagName  = "section"
    options.cssClass = "custom-quote"
    super options, data

  viewAppended: ->
    @addSubView new KDHeaderView
      title    : "Want more giant-sized Resource Pack or want to deploy a custom version to your intranet?"
      type     : "medium"
      cssClass : "general-title"

    @addSubView new KDButtonView
      title    : "GET A CUSTOM QUOTE"
      style    : "solid border-only green medium"
