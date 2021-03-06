define [
    'chaplin'
    'controllers/hello_controller'
], (Chaplin, HelloController) ->
    'use strict'

    # The application object.
    # Choose a meaningful name for your application.
    class Application extends Chaplin.Application
        title: 'Chaplin example application'
        # start: ->
        #   # You can fetch some data here and start app
        #   # (by calling `super`) after that.
        #   super
        #$('body').html 'Hello World'

        initControllers: ->
            new HelloController()
            