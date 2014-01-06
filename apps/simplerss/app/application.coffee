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

  Templates = require 'templates'
  

  prepare_app = (app) ->
    app.addRegions
      mainbar: '#mainbar'
      content: '#content'
      main_menu: '#main-menu'
      user_menu: '#user-menu'
      sidebar: '.sidebar'
      rcontent: '.right-column-content'
      
    app.on 'initialize:after', ->
      Backbone.history.start() unless Backbone.history.started
      #$('#header').text 'initialize:after'
      #console.log 'initialize:after'
      
    app.on 'initialize:before', ->
      #$('#header').text 'initialize:before'
      #console.log 'initialize:before'
    
    app.msgbus = MSGBUS

    app.addInitializer ->
      MSGBUS.commands.execute 'simplerss:route'
    
    MSGBUS.events.on 'app:show', (view) =>
      console.log 'app:show called, view is ' + view
      # show the view
      app.rcontent.show view

    MSGBUS.events.on 'rss:button:clicked', (button) ->
      console.log 'clicked rss button'

    MSGBUS.events.on 'showfeed:id', (feed_id) ->
      console.log "Show Feed " + feed_id
      

  app = new Marionette.Application()

  app.current_user = new common_models.CurrentUser
  response = app.current_user.fetch()
  app.ready = false
  response.done ->
    # render page?
    $('body').html Templates.layout()
    prepare_app app
    app.ready = true

    
  
  module.exports = app
    
    
