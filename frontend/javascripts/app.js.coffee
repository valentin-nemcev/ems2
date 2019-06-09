window.EMS ?= {}

class EMS.Resource extends Backbone.Model

class EMS.ToplevelResources extends Backbone.Collection
  model: EMS.Resource
  url  : '/resources'


class EMS.ToplevelNavigation extends Backbone.View
  initialize: ->
    @collection.bind('reset', @render, @)

  render: ->
    console.info @collection
    $(@el).empty()
    @collection.each (resource) =>
      $(@el).append(@makeNavigationLink(resource))

    return this

  makeNavigationLink: (resource) ->
    $ '<a>',
      class: 'navigation'
      href: resource.get('link')
      text: resource.get('name')
      click: (ev) -> ev.preventDefault()

  events:
    'click a.navigation': 'navigate'

  navigate: (ev) ->
    console.info(ev)
    @trigger 'navigate', $(ev.currentTarget).attr('href')


class EMS.App

  constructor: ->
    $page = $(document)

    @toplevelResources = new EMS.ToplevelResources

    @navigation = new EMS.ToplevelNavigation
      collection: @toplevelResources
      el: $page.find('nav.top-level')[0]

    @navigation.bind 'navigate', (uri) ->
      console.info(uri)
      $.get '/resources' + uri, (resp) ->
        console.info(resp)

    @toplevelResources.fetch()


    # appRouter = new Backbone.Router
    # appRouter.route '*path', 'main', -> console.info(arguments))
    # Backbone.history.start()

    # $page.on 'click', 'a.navigation', (ev) ->
    #   ev.preventDefault()
    #   appRouter.navigate($(this).attr('href'), true)
