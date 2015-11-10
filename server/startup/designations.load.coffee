Meteor.startup ->
  if Designations.find().count() == 0
    designations = [
      {
        'name': 'designation 1',
        'deleted': 0
      }
      {
        'name': 'designation 2',
        'deleted': 0
      }
    ]
    designations.forEach (designation) ->
      Designations.insert designation