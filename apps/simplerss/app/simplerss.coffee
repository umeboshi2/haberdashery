#
# Simple RSS app
define (require, exports, module) ->
  Backbone = require 'backbone'
  MSGBUS = require 'msgbus'

  Controller = require 'controller'
  Collections = require 'collections'
  Models = require 'models'
  
  
  feeds = MSGBUS.reqres.request 'rss:feedlist'

  class Router extends Backbone.Marionette.AppRouter
    appRoutes:
      '': 'start'
      'simplerss': 'start'
      'showfeed/:id': 'showfeed'
      
  MSGBUS.commands.setHandler 'simplerss:route', (foo) ->
    console.log "simplerss:route being handled"
    controller = new Controller
    controller.setFeeds feeds
    router = new Router
      controller: controller
    router.navigate('#')
    return router
    