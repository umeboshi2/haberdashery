define (require, exports, module) ->
  Backbone = require 'backbone'
  MSGBUS = require 'msgbus'
  Templates = require 'templates'
  Marionette = require 'marionette'
  
  class EmptyView extends Backbone.Marionette.ItemView
    template: Templates.rss_feed_entry_empty
    
  class FeedEntryView extends Backbone.Marionette.ItemView
    template: Templates.rss_feed_entry

  class FeedListView extends Backbone.Marionette.CollectionView
    template: Templates.rss_feed_list
    itemView: FeedEntryView

  class FeedDataView extends Backbone.Marionette.ItemView
    template: Templates.viewfeed
    
  class Layout extends Backbone.Marionette.Layout
    template: Templates.rss_feed_list

  class ButtonView extends Backbone.Marionette.ItemView
    template: Templates.button
    events:
      'click': -> MSGBUS.events.trigger 'rss:button:clicked', @model
      
    
  class SideView extends Backbone.Marionette.ItemView
    template: Templates.sidebar

    
  module.exports =
    EmptyView: EmptyView
    FeedEntryView: FeedEntryView
    FeedListView: FeedListView
    Layout: Layout
    SideView: SideView
    ButtonView: ButtonView
    FeedDataView: FeedDataView
    