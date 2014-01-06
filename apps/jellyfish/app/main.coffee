# require config comes first
require.config
    baseUrl: 'jellyfish/app'
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
            


# top level always requires bootstrap
#
#require ['jquery', 'underscore', 'bootstrap', 'backbone'], ->
#    app = window.app = _.extend window.app || {},
#        views: {}

#require ['jquery', 'backbone', 'teacup'],
#($, Backbone, teacup) ->
#    body = $ 'body'
#    template = teacup.renderable ->
#        teacup.div '.action-button', ->
#            teacup.a href:'http://google.com', 'Google'
#    $ ->
#        body.html template()


#require ['config/_base', 'application',
#'apps/book/app', 'apps/other/app'], (_config, App) ->
#    App.start()

require ['application',
'apps/book/app', 'apps/other/app'], (App) ->
    window.app = App
    App.start()
           
        

    