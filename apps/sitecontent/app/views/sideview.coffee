define (require, exports, module) ->
    $ = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    templates = require 'views/templates'
    
    ########################################
    # Side View
    ########################################
    class SideView extends Backbone.View
        el: $ '.sidebar'
            
        initialize: (app) ->
            console.log('Init SideView')
            @current_view = null
            @router = app.router
            
        
        template:
            templates.side_view
                        
        render: =>
            sidebar = $ '.sidebar'
            #@$el.html @template()
            sidebar.html @template()
            console.log(@$el)
            return @


        # pull_trigger is to activate views
        # when the route changes
        pull_trigger = trigger: true, replace: true
        events:
            'click .home-button': ->
                @router.navigate '', pull_trigger
                                
            'click .sitepaths-button': ->
                $('.listview-list').remove()
                @router.navigate 'dummy', pull_trigger
                @router.navigate 'view/path', pull_trigger
                                
            'click .sitetmpl-button': ->
                $('.listview-list').remove()
                @router.navigate 'dummy', pull_trigger
                @router.navigate 'view/tmpl', pull_trigger
    
            'click .sitecss-button': ->
                $('.listview-list').remove()
                @router.navigate 'dummy', pull_trigger
                @router.navigate 'view/css', pull_trigger
                                
            'click .sitejs-button': ->
                $('.listview-list').remove()
                @router.navigate 'dummy', pull_trigger
                @router.navigate 'view/js', pull_trigger

            'click .siteapp-button': ->
                $('.listview-list').remove()
                @router.navigate 'dummy', pull_trigger
                @router.navigate 'view/app', pull_trigger

            
                                
    module.exports = SideView
    