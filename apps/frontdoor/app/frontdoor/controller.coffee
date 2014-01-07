define (require, exports, module) ->
  $ = require 'jquery'
  Backbone = require 'backbone'
  Marionette = require 'marionette'
  MSGBUS = require 'msgbus'

  Views = require 'views/mainviews'

  main_menu_data =
    tagclass: 'main-menu'
    label: 'Main'
    entries: [
      {
        name: 'Simple RSS'
        url: '/apps/simplerss'
      }
      {
        name: 'Jellyfish'
        url: '/apps/jellyfish'
      }
      ]

  MainMenuModel = new Backbone.Model main_menu_data
  
    
  
  class Controller extends Backbone.Marionette.Controller
    start: ->
      console.log 'called controller.start()'
      layout = new Views.MainPageLayout
      layout.on 'show', =>
        view = new Views.MainPageView
          el: 'body'
        mainbar = new Views.MainBarView
          el: '#mainbar'
        mainbar.render()
        mainmenu = new Views.MenuView
          el: '#main-menu'
          model: MainMenuModel
        mainmenu.render()
        # FIXME: get current user from MSGBUS
        user = MSGBUS.reqres.request 'current:user'
        
        usermenu = new Views.UserMenuView
          el: '#user-menu'
          model: user
        usermenu.render()
        
          
      MSGBUS.events.trigger 'mainpage:show', layout
      
      #MSGBUS.events.trigger 'mainbar:show', layout
      

  module.exports = Controller
  
