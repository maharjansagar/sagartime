'use strict'

Meteor.publish 'etimesheets', (options, searchString) ->
  where =
    'user':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfEtimesheets', Etimesheets.find(where), noReady: true
  Etimesheets.find where, options