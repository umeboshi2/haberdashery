define (require, exports, module) ->
    $ = require 'jquery'
    jQuery = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    bootstrap = require 'bootstrap'
    
    class Router extends Backbone.Router
        initialize: (app) ->
            app.router = @
            @app = app
             
        routes:
            '': 'home'
            'view/:listview': 'listview'

        common: ->
            if @app.side_view != undefined
                @app.side_view.render()
                if @app.side_view.current_view != null
                    @app.side_view.current_view.remove()


        home: ->
            @common()

        listview: (lview) ->
            @common()
            klass = list_views()[lview]
            view = new klass
            view.render type: lview
            @app.side_view.current_view = view


                        
                                    
            
    module.exports = Router
    
    
