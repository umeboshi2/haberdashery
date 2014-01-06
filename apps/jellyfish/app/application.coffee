define (require, exports, module) ->
    $ = require 'jquery'
    jQuery = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'
    bootstrap = require 'bootstrap'
    Marionette = require 'marionette'
    msgBus = require 'msgbus'
    bsModal = require 'bsModal'
    
    templates = require 'views/templates'
    config = require 'config/_base'

    Page = require 'common/page'
    
        
    app = new Marionette.Application()
    app.addRegions
        content: '.right-column-content'
        menu: '.sidebar'
        modal: Marionette.Region.Dialog.extend el: '#modal'

    app.on 'initialize:after', ->
        Backbone.history.start() unless Backbone.history.started

    app.addInitializer ->
        msgBus.commands.execute 'books:route'
        msgBus.commands.execute 'other:route'

    msgBus.events.on 'app:show:modal', (view) =>
        app.modal.show view

    msgBus.events.on 'app:show', (view) =>
        app.content.show view

    $ ->
        pagemodel =
            header: 'Jellyfish'
            
        user =
            username: 'UNKNOWN USER'
            get: (att) ->
                'UNKNOWN USER'
        #body = $ 'body'
        #body.html Page.render user, pagemodel
        Page.render user, pagemodel
        $('.right-column-content').html templates.body()
        $('.sidebar').html templates.sidebar()
        
    module.exports = app
    
    
