# currency list controller
define (require, exports, module) ->
    Views = require 'apps/other/show/views'
    msgBus = require 'msgbus'

    
    module.exports =
        listRSSFeeds: (feeds) ->
            window.thisview = @
            @layout = @getLayout()
            @layout.on 'show', =>
                view = @showRssList feeds
                window.thatview = view
            msgBus.events.trigger 'app:show', @layout
            
        showRssList: (feeds) ->
            listview = @getListView feeds
            window.listview = listview
            @layout.feeds.show listview

        getLayout: ->
            return new Views.Layout

        getListView: (feeds) ->
            view = new Views.FeedListView
                collection: feeds
            return view
            
        get_main_view: ->
            @layout = @getLayout()
            @layout.on 'show', =>
                view = new Views.MainView
                return view
            msgBus.events.trigger 'app:show', @layout
            
            
