define (require, exports, module) ->
    $ = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    teacup = require 'teacup'

    renderable = teacup.renderable

    div = teacup.div
    # I use "icon" for font-awesome
    icon = teacup.i
    strong = teacup.strong
    span = teacup.span
    label = teacup.label
    input = teacup.input

    text = teacup.text

    # Main Templates must use teacup.
    # The template must be a teacup.renderable, 
    # and accept a layout model as an argument.

    # Tagnames to be used in the template.
    {div, span, link, text, strong, label, input, 
    button, a, nav, form,
    ul, li, b} = teacup
            
    
    ########################################
    # Templates
    ########################################
    list_titles =
        user: 'Users'
        group: 'Groups'
        
    #######################################################
    _addgroup = '#addgroup.btn.btn-default.btn-xs.pull-right'
    main_user_view = renderable (user) ->
        div '.main-user-view', ->
            text 'view user '
            strong user.username
            div '.listview-header', ->
                text "Groups for " + user.username
                # add group button
                div _addgroup, ->
                    text "Add Group"
            div '.listview-list.user-group-list'
            
    user_group_entry = renderable (group) ->
        div ->
            text group.name
            div '.detach-group.btn.btn-default.btn-xs', ->
                text "remove"
                                
    main_group_view = renderable (group) ->
                div '.main-group-view', ->
                    div '.listview-header', ->
                        text 'view group '
                        strong group.name
                    div '.listview-list.group-members-list'
                    
    listview_template = renderable (data) ->
        nbtn = '#new-entry-button.pull-right.btn.btn-default.btn-xs.add-entry-btn'
        div '.listview-header', ->
            text list_titles[data.type]
            div nbtn, ->
                icon '.fa.fa-plus-square'
        div '.listview-list'
                
                    
                                        
                        
    #######################################################
    module.exports =
        listview: listview_template
        main_group: main_group_view
        main_user: main_user_view
        user_group_entry: user_group_entry
        
        
        
    
