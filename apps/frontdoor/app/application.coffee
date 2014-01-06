define (require, exports, module) ->
    $ = require 'jquery'
    jQuery = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    bootstrap = require 'bootstrap'
    
    templates = require 'views/templates'
    
    SideView = require 'views/sideview'

    Router = require 'router'

    Page = require 'common/page'
        
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
            pagemodel =
                header: 'Front Door'
                
            Page.render @current_user, pagemodel
            
            @side_view = new SideView @
            @side_view.render()
            if @current_user.get('username') == undefined
                login_form = templates.login_form
                div = $ '#content'
                div.html login_form @current_user
            $('#header').addClass('listview-header')
            
    module.exports = ApplicationView
    
