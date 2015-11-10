'use strict'

Meteor.publish 'designations', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfDesignations', Designations.find({deleted:0}), noReady: true
  Designations.find where, options