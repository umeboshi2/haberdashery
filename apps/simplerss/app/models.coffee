define (require, exports, module) ->
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  ########################################
  # Collections
  ########################################

  class User extends Backbone.Model
    defaults:
      objtype: 'user'

  class Group extends Backbone.Model
    defaults:
      objtype: 'group'

  class SimpleButton extends Backbone.Model
    defaults:
      name: 'SimpleButton'
      bclass: 'simple-button'
      
  class RssFeed extends Backbone.Model
    defaults:
      name: 'No RSS'
      url: '#'
      
  make_rss_data_model = (rss_id) ->
    class RssData extends Backbone.Model
      url: '/rest/simplerss/feeds/' + rss_id + '/feeddata'
    return new RssData(rss_id)
    
      
  module.exports =
    User: User
    Group: Group
    RssFeed: RssFeed
    make_rss_data_model: make_rss_data_model
    SimpleButton: SimpleButton
    