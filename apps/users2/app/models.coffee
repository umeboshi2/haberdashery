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

    module.exports =
        User: User
        Group: Group
