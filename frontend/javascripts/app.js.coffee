window.EMS ?= {}

class EMS.Resource extends Backbone.Model

class EMS.ToplevelResources extends Backbone.Collection
  model: EMS.Resource
  url  : '/resources'

class EMS.NavigationLink extends Backbone.View
  tagName: 'a'

  render: ->
    $(@el).text(@model.get('name'))
    return this

class EMS.ToplevelNavigation extends Backbone.View
  initialize: ->
    @collection.bind('reset', @render, @)

  render: ->
    $(@el).html @collection.map (resource) ->
      (new EMS.NavigationLink(model: resource)).render().el

    console.info @collection.toJSON(), @el, $(@el)
    return this

class EMS.App

  constructor: ->
    $page = $(document)

    @toplevelResources = new EMS.ToplevelResources

    new EMS.ToplevelNavigation
      collection: @toplevelResources
      el: $page.find('nav.top-level')[0]

    @toplevelResources.fetch()
