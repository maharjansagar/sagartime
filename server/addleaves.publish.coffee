'use strict'

Meteor.publish 'addleaves', (options, searchString) ->
  where =
    'user':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'deleted' : 0
  Counts.publish this, 'numberOfAddleaves', Addleaves.find({'deleted':0}), noReady: true
  Addleaves.find where, options