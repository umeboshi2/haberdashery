# show the other app
define (require, exports, module) ->
    Backbone = require 'backbone'
    Controller = require 'apps/other/show/controller'
    msgBus = require 'msgbus'
    simplerss = require 'entities/simplerss'
    
    feeds = msgBus.reqres.request 'rss:feedlist'
    

    # private module/app router  capture the #seconapp route and call start method of our controller
    class Router extends Backbone.Marionette.AppRouter
        appRoutes:
            'otherapp': 'start'

    # handle the other:route command during main application start/init process
    msgBus.commands.setHandler "other:route", ->
        new Router
            controller: API

    # controller API
    API =
        start: ->
            #view = Controller.get_main_view()
            view = Controller.listRSSFeeds feeds
            view
            
            
    module.exports = API