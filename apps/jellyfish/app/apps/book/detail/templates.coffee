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
    detail = renderable () ->
        a '#close-dialog.close', 'data-dismiss':'modal', 'x'
        div '.imgBook', ->
            imgsrc = thumbnail ? thumbnail : 'http://placehold.it/200x260'
            img src:imgsrc
        h1 title
        subtitle ? h2 subtitle
        desc = description ? description : 'no description found'
        p desc
        b 'Google link:'
        href ='http://books.google.com/books?id=' + googleId 
        a href:href, target:'_blank', href
            
    module.exports =
        bookdetail: detail
