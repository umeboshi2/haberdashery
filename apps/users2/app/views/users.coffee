define (require, exports, module) ->
    $ = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    entry_templates = require 'templates/entry'
    view_templates = require 'templates/userviews'
    collections = require 'collections'
            
    {BaseMainContentView, BaseModelView,
    BaseListView} = require 'common/views/base'
    
    ########################################
    # Users Views
    ########################################
    class MainUserView extends BaseMainContentView
        render: (user) ->
            tmpl = view_templates.main_user
            html = tmpl(user)
            @$el.html html
            uview = new UserGroupListView  user
            return @
                                                                        
    class UserListView extends BaseListView
        initialize: ->
            console.log('Init UserListView')
            @collection = new collections.UserList
            @collection.bind 'add', @appendItem
            @collection.fetch()

        appendItem: (model) =>
            view = new @modelView model: model
            # FIXME
            window.mbview = view
            html = view.render(model).el
            $('.listview-list').append html

    class UserGroupView extends Backbone.View
        template: entry_templates.entry

        initialize: ->
            _.bindAll @, 'render'
            @model.bind 'change', @render
            @model.bind 'remove', @unrender

        render: ->
            #html = @model.get 'name'
            # FIXME This is a HACK
            tmpl = view_templates.user_group_entry
            html = tmpl @model.attributes
            this.$el.html html
            # FIXME: I want to use the
            # declarative events instead
            # of implementing a callback here
            addgrpbutton = $ '#addgroup'
            addgrpbutton.click =>
                this.add_group()
            return @

        unrender: ->
            $(@el).remove()
                
        events:
            'click .detach-group': 'detach_group'

        detach_group: ->
            @model.destroy()
            @unrender()
                        
        add_group: ->
            console.log('add_group')
            make_group_select_dlg()

                
    # this is part of MainUserView     
    class UserGroupListView extends Backbone.View
        el: $ '.user-group-list'
                
        initialize: (user) ->
            #console.log('Init UserGroupListView ' + user.id)
            @collection = collections.make_ug_collection user.id
            @collection.bind 'add', @appendItem
            @collection.fetch()

        modelView: UserGroupView

                
        appendItem: (model) =>
            view = new @modelView model: model
            html = view.render(model).el
            $('.user-group-list').append html

                        
        events:
            'click #addgroup': 'add_group'
                        
        add_group: ->
            console.log('add_group')
            #make_group_select_dlg()





                                
    module.exports =
        MainUserView: MainUserView
        UserListView: UserListView
        UserGroupView: UserGroupView
        UserGroupListView: UserGroupListView
         
    