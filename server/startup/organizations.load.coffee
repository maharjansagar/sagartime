Meteor.startup ->
  if Organizations.find().count() == 0
    organizations = [
      {
        'name': 'organization 1',
        'deleted': 0
      }
      {
        'name': 'organization 2',
        'deleted': 0        
      }
    ]
    organizations.forEach (organization) ->
      Organizations.insert organization