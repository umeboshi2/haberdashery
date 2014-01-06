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
    user_menu = renderable (user) ->
        console.log user
        name = user.get 'username'
        ul '.ctx-menu.nav.navbar-nav', ->
            li '.dropdown', ->
                a '.dropdown-toggle', 'data-toggle':'dropdown', ->
                    console.log 'NAME' + name
                    if name == undefined
                        text "Guest"
                    else
                        text name
                    b '.caret'
                ul '.dropdown-menu', ->
                    if name == undefined
                        li ->
                            a href:'/login', 'login'
                    else
                        li ->
                            a href:'/usr/status', 'Preferences'
                        # we need a "get user info" from server
                        # to populate this menu with 'admin' link
                        admin = false
                        unless name == undefined
                            groups = user.get 'groups'
                            if groups != undefined
                                for g in groups
                                    if g.name == 'admin'
                                        admin = true
                        if admin
                            li ->
                                a href:'/admin', 'Administer Site'
                        li ->
                            a href:'/logout', 'Logout'
    ########################################
    PageLayoutTemplate = renderable (user) ->
        div '.page', ->
            nav '.navbar.navbar-default.navbar-fixed-top.main-menu',\
            'data-spy':'affix', 'data-offset-top':'10', ->
                div '.navbar-header', ->
                    # the id for the data-target came from a tutorial
                    # and it should be renamed
                    button '.navbar-toggle', type:'button', 'data-toggle':'collapse',\
                    'data-target':'#ctx-menu-collapse-1', ->
                        span '.sr-only', 'Toggle navigations'
                        span 'badge', 'expand'
                    a '.navbar-brand', href:"/", 'brand'
                div '#ctx-menu-collapse-1.collapse.navbar-collapse', ->
                    div '#user-menu.navbar.navbar-nav.navbar-right', ->
                        user_menu user
                    div '#main-menu.nav.navbar-nav.navbar-left'
            div '.main-content', ->
                div '.header.listview-header'
                div '.subheader'
                div '.two-col', ->
                    div '.sidebar'
                    div '.right-column-content'
                div '.footer'
            
    module.exports = PageLayoutTemplate
    