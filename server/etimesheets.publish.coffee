'use strict'

Meteor.publish 'etimesheets', (options, searchString) ->
  where =
    'user':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
    'deleted' : 0
  Counts.publish this, 'numberOfEtimesheets', Etimesheets.find({deleted: 0}), noReady: true
  Etimesheets.find where, options