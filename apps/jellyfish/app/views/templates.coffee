# modular template loading
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
    img = teacup.img
    section = teacup.section    
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
    body = renderable () ->
        #section '.title.listview-header', 'Marionette Bookstore (AMD)'
        section '.no-content'
        section '#modal'
        
    sidebar = renderable () ->
        div '.listview-header', ->
            div ->
                a href:'#', 'Marionette Bookstore'
            div ->
                a href:'#search/6502', '6502'
            div ->
                a href:'#otherapp', 'Other App'
            div ->
                a href:'#search/Chinese Crested', "Chinese Crested"
            div ->
                a href:'#search/Heart of Darkness', 'Heart of Darkness'
            div ->
                a href:'#search/6502', '6502'
                
                
        
    module.exports =
        body: body
        sidebar: sidebar
        
