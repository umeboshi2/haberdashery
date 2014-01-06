define (require, exports, module) ->
    $ = require 'jquery'
    jQuery = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    bootstrap = require 'bootstrap'
    
    templates = require 'views/templates'

    SideView = require 'views/sideview'

    Router = require 'router'
    
    class CurrentUser extends Backbone.Model
        url: '/rest/current/user'

    class CurrentPage extends Backbone.Model
        url: '/rest/webviews/default'
        
    
    class ApplicationView extends Backbone.View
        el: $ 'body'
    
        initialize: () ->
            @current_user = new CurrentUser()
            response = @current_user.fetch()
            response.done =>
                @render()
                
        render: ->
            @$el.append templates.PageLayoutTemplate @current_user
            @side_view = new SideView @
            #sidebar_el = $ '.sidebar'
            #window.sidel = sidebar_el
            #console.log(sidebar_el)
            #sidebar_el.text 'sdf '
            @side_view.render()
            $('.header').text "Hello WOrld"
            
    module.exports = ApplicationView
    
    
