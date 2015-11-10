'use strict'

Meteor.publish 'addleaves', (options, searchString) ->
  where =
    'user':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfAddleaves', Addleaves.find(where), noReady: true
  Addleaves.find where, options