class PricingPlansView extends KDView

  initialState: {}

  constructor: (options = {}, data) ->

    options.tagName  = "section"
    options.cssClass = "plans clearfix"

    super options, data

    @state = @utils.extend @initialState, options.state

    @planViews = {}

    for plan in @plans
      plan.delegate = this
      planTitle = plan.title.toLowerCase()
      plan.state = @state
      @addSubView view = new SinglePlanView plan
      @forwardEvent view, "PlanSelected"
      @planViews[planTitle] = view


  plans: [
    title        : 'Free'
    monthPrice   : 0
    reducedMonth : 0
    yearPrice    : 0
    discount     : 0
    description  : 'Best for tinkering with and learning new technologies'
    cssClass     : 'free'
    planFeatures : [
      { partial: '1 GB RAM'     , cssClass: 'ram' }
      { partial: '1 Core'       , cssClass: 'cpu' }
      { partial: '3 GB Storage' , cssClass: 'storage' }
      { partial: '1 VM total'   , cssClass: 'vm-count' }
      { partial: '0 Always on'  , cssClass: 'always-on disabled' }
    ]
  ,
    title        : 'Hobbyist'
    monthPrice   : 1250
    reducedMonth : 995
    yearPrice    : 11940
    discount     : 255
    description  : 'Best for expanded learning or for running a small blog/website'
    cssClass     : 'hobbyist'
    planFeatures : [
      { partial: '1 GB RAM'     , cssClass: 'ram' }
      { partial: '1 Core'       , cssClass: 'cpu' }
      { partial: '3 GB Storage' , cssClass: 'storage' }
      { partial: '1 VM total'   , cssClass: 'vm-count' }
      { partial: '1 Always on'  , cssClass: 'always-on disabled' }
    ]
  ,
    title        : 'Developer'
    monthPrice   : 2450
    reducedMonth : 1995
    yearPrice    : 23940
    discount     : 455
    description  : 'Great for developers who work with multiple environments'
    cssClass     : 'developer'
    planFeatures : [
      { partial: '1 GB RAM'      , cssClass: 'ram' }
      { partial: '1 Core'        , cssClass: 'cpu' }
      { partial: '15 GB Storage' , cssClass: 'storage' }
      { partial: '3 VMs total'   , cssClass: 'vm-count' }
      { partial: '1 Always on'   , cssClass: 'always-on' }
    ]
  ,
    title        : 'Professional'
    monthPrice   : 4950
    reducedMonth : 3995
    yearPrice    : 47940
    discount     : 955
    description  : 'Great for managing and delivering client work'
    cssClass     : 'professional'
    planFeatures : [
      { partial: '1 GB RAM'      , cssClass: 'ram' }
      { partial: '1 Core'        , cssClass: 'cpu' }
      { partial: '25 GB Storage' , cssClass: 'storage' }
      { partial: '5 VMs total'   , cssClass: 'vm-count' }
      { partial: '2 Always on'   , cssClass: 'always-on' }
    ]
  ]

