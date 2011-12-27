window.EMS ?= {}
class EMS.ToplevelResources extends Backbone.Collection
  model: EMS.Resource
  url  : '/resources'

class window.EMSApp

  constructor: ->
    @toplevelResources = new EMS.ToplevelResources

    @toplevelResources.fetch()
