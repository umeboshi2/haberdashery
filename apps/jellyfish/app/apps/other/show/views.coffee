# views supporint the book list application:  FWIW all views inherit from views/_base
define (require, exports, module) ->
    Templates = require 'apps/other/show/templates'
    AppViews = require 'views/_base'
    msgBus = require 'msgbus'
    # other stuff goes here
    class Layout extends AppViews.Layout
        template: Templates.main_view
        regions:
            header: '#appheader'
            feeds: '.rss-feeds'
            
    class FeedNameView extends AppViews.ItemView
        template: Templates.feed_entry
        
        
    class FeedListView extends AppViews.CompositeView
        id: 'feedlist-view'
        template: Templates.feed_list
        itemview: FeedNameView
        itemViewContainer: 'div.rss-feeds'

        
    class MainView extends AppViews.ItemView
        template: Templates.otherView

    window.Templates = Templates
    
    module.exports =
        Layout: Layout
        FeedNameView: FeedNameView
        FeedListView: FeedListView
        MainView: MainView