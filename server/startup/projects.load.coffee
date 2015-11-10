Meteor.startup ->
  if Projects.find().count() == 0
    projects = [
      {
        'name': 'project 1',
        'deleted':0
      }
      {
        'name': 'project 2',
        'deleted':0
      }
    ]
    projects.forEach (project) ->
      Projects.insert project