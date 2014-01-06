define (require, exports, module) ->
    $ = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    entry_templates = require 'templates/entry'
    view_templates = require 'templates/userviews'
    collections = require 'collections'
    
    {BaseMainContentView, BaseModelView,
    BaseListView} = require 'common/views/base'
    
    make_group_select_dlg = ->
        console.log("make_group_select_dlg")
        html = '<div id="select-group-dialog"></div>'
        page = $ '.main-content'
        page.append html
        dl = $ '#select-group-dialog'
        view = new GroupSelectView
        html = view.render
        dl.dialog
            dialogClass: 'no-close'
            modal: true
            buttons:
                'cancel': ->
                    $(this).dialog 'close'
                    dl.remove()
                                        
                                
                
    ########################################
    # Groups Views
    ########################################
    class MainGroupView extends BaseMainContentView
        render: (group) ->
            tmpl = view_templates.main_group
            @$el.html tmpl group
            return @
                                                                        
    class GroupListView extends BaseListView
        initialize: ->
            console.log('Init GroupListView')
            @collection = new collections.GroupList
            @collection.bind 'add', @appendItem
            @collection.fetch()

    class GroupSelectView extends Backbone.View
        el: $ '#select-group-dialog'
    
        initialize: ->
            console.log('Init GroupSelectView')
            @collection = new collections.GroupList
            @collection.bind 'add', @appendItem
            @collection.fetch()

        remove: () ->
            @undelegateEvents()
            @$el.empty()
            @stopListening()
            return @
                        
        render: (data) ->
            tmpl = view_templates.listview
            @$el.html tmpl.render data
            return @

        modelView: BaseModelView

                
        appendItem: (model) =>
            view = new @modelView model: model
            html = view.render(model).el
            $('#select-group-dialog').append html



                                
    module.exports =
        make_group_select_dlg: make_group_select_dlg
        MainGroupView: MainGroupView
        GroupListView: GroupListView
        GroupSelectView: GroupSelectView
