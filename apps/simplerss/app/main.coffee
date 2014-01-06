# require config comes first
#
# msgbus/route strings
# -----------------------
# 
# reqres:  rss:feed
# route :  simplerss, start
# event :  initialize:after
# 


require.config
  baseUrl: 'simplerss/app'
  paths:
    jquery: '/components/jquery/jquery'
    underscore: '/components/underscore-amd/underscore'
    backbone: '/components/backbone-amd/backbone'
    'backbone.wreqr': '/components/backbone.wreqr/lib/amd/backbone.wreqr'
    'backbone.babysitter': '/components/backbone.babysitter/lib/amd/backbone.babysitter'
    marionette: '/components/marionette/lib/core/amd/backbone.marionette'
    ace: '/components/ace/lib/ace'
    bootstrap: '/components/bootstrap/dist/js/bootstrap'
    bsModal: '/components/bootstrap/js/modal'
    'jquery-ui': '/components/jquery-ui/ui/jquery-ui'
    requirejs: '/components/requirejs/require'
    text: '/components/requirejs-text/text'
    common: '/apps/common/app'
    teacup: '/stdlib/teacup'
  shim:
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    underscore:
      exports: '_'
    jquery:
      exports: ['$', 'jQuery']
    teacup:
      exports: ['teacup']
    bootstrap:
      deps: ['jquery']
    bsModal:
      deps: ['jquery']
            
requirements = [
  'application'
  'simplerss'
  ]
  

#App = require 'application'

#window.app = App
#App.start()

require requirements, (App) ->
    window.app = App


    start_app_one = () ->
      if App.ready == false
        setTimeout(start_app_two, 100)
      else
        App.start()
        
    start_app_two = () ->
      if App.ready == false
        setTimeout(start_app_one, 100)
      else
        App.start()
    
    start_app_one()
    