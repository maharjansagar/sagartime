'use strict'

Meteor.publish 'users', (options, searchString) ->
  where =
    'profile':
      '$elemMatch':
        'fname':
          '$regex': '.*' + (searchString or '') + '.*'
          '$options': 'i'
        'deleted' : '0' 
  Counts.publish this, 'numberOfUsers', Meteor.users.find({'profile.deleted':'0'}), noReady: true
  Meteor.users.find where, options