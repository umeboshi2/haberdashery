# require config comes first
require.config
    baseUrl: 'users2/app'
    paths:
        jquery: '/components/jquery/jquery'
        ace: '/components/ace/lib/ace'
        backbone: '/components/backbone/backbone'
        bootstrap: '/components/bootstrap/dist/js/bootstrap'
        'jquery-ui': '/components/jquery-ui/ui/jquery-ui'
        requirejs: '/components/requirejs/require'
        underscore: '/components/underscore/underscore'
        common: '/apps/common/app'
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


# top level always requires bootstrap
#
#require ['jquery', 'underscore', 'bootstrap', 'backbone'], ->
#    app = window.app = _.extend window.app || {},
#        views: {}

require ['application', 'router', 'backbone'],
(Application, Router, Backbone) ->
    app = new Application()
    router = new Router app
    window.app = app
    Backbone.history.start()
    
    return


    