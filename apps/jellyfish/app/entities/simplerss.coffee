define (require, exports, module) ->
    $ = require 'jquery'
    _ = require 'underscore'
    Backbone = require 'backbone'

    msgBus = require 'msgbus'
    

    class Feed extends Backbone.Model
        defaults:
            name: 'Google News'
            url: 'http://news.google.com/news?pz=1&cf=all&ned=us&hl=en&output=rss'
    class FeedData extends Backbone.Model
        initialize: (feed_id) ->
            @url = '/rest/simplerss/feeds/' + feed_id + '/feeddata'
            

    ########################################
    # Collections
    ########################################
    class BaseCollection extends Backbone.Collection
        # wrap the parsing to retrieve the
        # 'data' attribute from the json response
        parse: (response) ->
            return response.data
                
    class FeedList extends BaseCollection
        model: Feed
        url: '/rest/simplerss/feeds'

    get_feed_data = (feed_id) ->
        new FeedData feed_id
        
    msgBus.reqres.setHandler 'rss:feedlist', ->
        new FeedList
        
    module.exports =
        get_feed_data: get_feed_data
        FeedList: FeedList
        Feed: Feed
        