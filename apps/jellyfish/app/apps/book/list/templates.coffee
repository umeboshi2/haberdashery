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
    # Main Templates must use teacup.
    # The template must be a teacup.renderable, 
    # and accept a layout model as an argument.

    # Tagnames to be used in the template.
    {div, span, link, text, strong, label, input, 
    button, a, nav, form, p,
    ul, li, b,
    h1, h2, h3,
    subtitle, section
    } = teacup
            
    
    ########################################
    # Templates
    ########################################
    layout = renderable () ->
        section '#credits.listview-header', 'By', ->
            a href:"http://twitter.com/t2k_nyc", 'Ted Killilea'
            text ', forked from '
            a href:"http://davidsulc.com", "David Sulc's repo"
            text ', based on the '
            a href:"http://www.atinux.fr/backbone-books/",
            'original application'
            text 'by '
            a href:"http://www.atinux.fr", 'Atinux'
            text '.'

            # FIXME
            $('.header').text 'Marionette Bookstore (AMD)'
            
        div '#searchBar', ->
            text 'Search :'
            input '#searchTerm.form-control', type:'text', name:'search',
            autocomplete:'on', value:''
            icon '#spinner.fa.fa-gear.fa-spin.fa-4x'
        div '#bookContainer'
    book = renderable (model) ->
        imgsrc = model.thumbnail ? thumbnail : 'http://placehold.it/200x260'
        img '.book.listview-header', alt:'', src:imgsrc, style:'display:inline;'

    booklist = renderable () ->
        tabstyle = 'display:table;width:100%;height:100%;'
        tlstyle = 'position:absolute;left: 0px;top: 0px;margin:1em;'
        trstyle = 'position:absolute;right: 0px;top: 0px;margin:1em;'
        icon '.fa.fa-arrow-left', style:tlstyle
        icon '.fa.fa-arrow-right', style:trstyle
        div style:tabstyle, ->
            div '.leftBar'
            div '.books', style:'display:table-cell;'
            div '.rightBar'
            
    detail = renderable (model) ->
        a '#close-dialog.close', 'data-dismiss':'modal', 'x'
        div '.imgBook', ->
            imgsrc = model.thumbnail ? thumbnail : 'http://placehold.it/200x260'
            img src:imgsrc
        h1 model.title
        model.subtitle ? h2 subtitle
        desc = model.description ? description : 'no description found'
        p desc
        b 'Google link:'
        href ='http://books.google.com/books?id=' + model.googleId 
        a href:href, target:'_blank', href
        
    module.exports =
        book: book
        books: booklist
        layout: layout
        bookdetail: detail
        
