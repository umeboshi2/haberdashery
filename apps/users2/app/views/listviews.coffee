define (require, exports, module) ->
    $ = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    listview_template = require 'templates/listview'
    create_template = require 'templates/create'
    entry_templates = require 'templates/entry'
    templates = require 'templates/userviews'
    
        
    {UserList, GroupList} = require 'collections'
    {BaseMainContentView
    BaseModelView
    BaseListView} = require 'common/views/base'
                                        
    {MainUserView} = require 'views/users'
    {MainGroupView} = require 'views/groups'


    class ModelView extends BaseModelView
        template: entry_templates.entry
        
        render: ->
            # FIXME This is a HACK
            # we are using one entry template
            # for both models.  The User db
            # object should really have a 'name'
            # attribute, rather than 'username',
            # but that will be done later.  For
            # now, there needs to be work done
            # on using abstract backbone 'classes'
            # upon different model types.
            if @model.has 'username'
                tmpl = entry_templates.user_entry
            else
                tmpl = entry_templates.entry
    
            #@model.set 'name', @model.get 'username'
            html = tmpl @model.attributes
            #html = @template.render @model.attributes
            this.$el.html html
            return @


        events:
            'click .show-entry-btn': 'showentry'

        showentry: ->
            el = $('.listview-list')
            if @model.get('objtype') == 'user'
                view = new MainUserView main_model: @model
            else
                view = new MainGroupView main_model: @model
            html = view.render @model.attributes
            el.html html
                        
        
        
    ########################################
    # List Views
    ########################################
    class ListView extends BaseListView
        template: templates.listview
        modelView: ModelView
                        
    class UserListView extends ListView
        initialize: ->
            console.log('Init UserListView')
            @collection = new UserList
            @collection.bind 'add', @appendItem
            @collection.fetch()

        appendItem: (model) =>
            view = new @modelView model: model
            # FIXME
            window.mbview = view
            html = view.render(model).el
            $('.listview-list').append html

    class GroupListView extends ListView
        initialize: ->
            console.log('Init GroupListView')
            @collection = new GroupList
            @collection.bind 'add', @appendItem
            @collection.fetch()

                
            
                                
    module.exports =
        user: UserListView
        group: GroupListView
        
    
