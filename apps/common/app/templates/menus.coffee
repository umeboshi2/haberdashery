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
    make_menu = renderable (lbl, entries) ->
      ul '.ctx-menu.nav.navbar-nav', ->
        li '.dropdown', ->
          a '.dropdown-toggle', 'data-toggle':'dropdown', ->
            text lbl
            b '.caret'
          ul '.dropdown-menu', ->
            for entry in entries
              li ->
                a href:entry.url, entry.name
            
    module.exports =
      make_menu = make_menu
      
    
    