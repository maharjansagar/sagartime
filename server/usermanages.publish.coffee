'use strict'

Meteor.publish 'usermanages', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfUsermanages', Usermanages.find(where), noReady: true
  Usermanages.find where, options

  