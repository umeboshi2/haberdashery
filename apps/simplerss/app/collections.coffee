define (require, exports, module) ->
  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  { User, Group, RssFeed,
  make_rss_data_model } = require 'models'
  MSGBUS = require 'msgbus'
      

  ########################################
  # Collections
  ########################################
  class BaseCollection extends Backbone.Collection
    # wrap the parsing to retrieve the
    # 'data' attribute from the json response
    parse: (response) ->
      return response.data

  class RssFeedList extends BaseCollection
    model: RssFeed
    url: '/rest/simplerss/feeds'
      
  class UserList extends BaseCollection
    model: User
    url: '/rest/users'

  class GroupList extends BaseCollection
    model: Group
    url: '/rest/groups'

  make_ug_collection = (user_id) ->
    class uglist extends BaseCollection
      model: Group
      url: '/rest/users/' + user_id + '/groups'
    return new uglist


  # set handlers on message bus
  # 
  MSGBUS.reqres.setHandler 'rss:feedlist', ->
    new RssFeedList

  MSGBUS.reqres.setHandler 'rss:feeddata', (feed_id) ->
    console.log 'handle rss:feeddata ' + feed_id
    model = make_rss_data_model feed_id
    return model
          

  module.exports =
    UserList: UserList
    GroupList: GroupList
    make_ug_collection: make_ug_collection
    RssFeedList: RssFeedList
    
    
