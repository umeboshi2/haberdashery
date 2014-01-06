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
    feed_entry = renderable (feed) ->
        feed = feed ? id:1, name:'google'
        div '.listview-list-entry', ->
            a href:'#otherapp/showdata/' + feed.id, feed.name

    main_view = renderable () ->
        div '#feedlist-view', ->
            div '#appheader.listview-header', ->
                text 'RSS Feed List'
            div '.feedlist'
            
    feed_list = renderable () ->
        div '.rss-feeds'
                        
    module.exports =
        feed_entry: feed_entry
        main_view: main_view
        feed_list: feed_list
        