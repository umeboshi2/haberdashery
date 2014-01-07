define (require, exports, module) ->
  $ = require 'jquery'
  jQuery = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  bootstrap = require 'bootstrap'
  Marionette = require 'marionette'
  MSGBUS = require 'msgbus'

  common_models = require 'common/models'
  Page = require 'common/page'
  main_menu = require 'common/templates/main-menu'


  prepare_app = (app) ->
    app.addRegions
      mainview: 'body'
      
      mainbar: '#mainbar'
      content: '#content'
      header: '#header'
      subheader: '#subheader'
      footer: '#footer'
      
      
      sidebar: '.sidebar'
      rcontent: '.right-column-content'
      
    app.on 'initialize:after', ->
      Backbone.history.start() unless Backbone.history.started
      
    app.msgbus = MSGBUS

    app.addInitializer ->
      MSGBUS.commands.execute 'frontdoor:route'
      
    # connect events
    MSGBUS.events.on 'mainpage:show', (view) =>
      console.log 'mainpage:show called'
      app.mainview.show view

    MSGBUS.events.on 'mainbar:show', (view) =>
      console.log 'mainbar:show called'
      app.mainbar.show view
      
  app = new Marionette.Application()
  app.current_user = new common_models.CurrentUser
  response = app.current_user.fetch()

  MSGBUS.reqres.setHandler 'current:user', ->
    app.current_user
    
    

  # we prepare the app after we fetch
  # the current user, then we assign
  # app.ready to true (I should use msgbus
  # for this).
  app.ready = false

  response.done ->
    prepare_app app
    app.ready = true
    
    
                        
  module.exports = app
  
    
