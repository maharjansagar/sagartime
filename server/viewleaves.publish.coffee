'use strict'

Meteor.publish 'viewleaves', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfViewleaves', Viewleaves.find(where), noReady: true
  Viewleaves.find where, options