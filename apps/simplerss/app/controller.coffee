define (require, exports, module) ->
  MSGBUS = require 'msgbus'
  Views = require 'views'
  $ = require 'jquery'
  Backbone = require 'backbone'
  Marionette = require 'marionette'

  Templates = require 'templates'
    
  
  class ListFeedController extends Backbone.Marionette.Controller

    showMain: (feeds) ->
      @layout = @getLayout()
      @layout.on 'show', =>
        view = @listFeeds feeds
        response = feeds.fetch()
        response.done ->
          console.log 'feeds fetched, render view'
          view.render()
          
          
      MSGBUS.events.trigger 'app:show', @layout

    setFeeds: (feeds) ->
      @feeds = feeds
      
    listFeeds: (feeds) ->
      new Views.FeedListView
        # this el is in the FeedListView template
        # and doesn't need to be on the DOM already
        el: '.rss-feedlist'
        collection: feeds
        
    getLayout: ->
      new Views.Layout

    getSideview: ->
      console.log 'getSideview'
      #bmodel = new Backbone.Model
      #  name: 'RSS'
      #  bclass: 'barfoo'
      #bview = new Views.ButtonView
      #  el: '.sidebar'
      #  model: bmodel
      bview = new Views.SideView
        el: '.sidebar'
      return bview
          
    start: ->
      console.log 'start list feeds view on simplerss app'
      sideview = @getSideview()
      sideview.render()
      @showMain @feeds
    
    playball: ->
      console.log "play ball"

    showfeed: (feed_id) ->
      console.log "show feed " + feed_id
      sideview = @getSideview()
      sideview.render()
      
      feeddata = MSGBUS.reqres.request 'rss:feeddata', feed_id
      window.feeddata = feeddata
      response = feeddata.fetch()
      response.done =>
        view = new Views.FeedDataView
          el: '.right-column-content'
          model: feeddata
        view.render()

  module.exports = ListFeedController
  
