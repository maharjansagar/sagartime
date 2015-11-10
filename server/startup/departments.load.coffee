Meteor.startup ->
  if Departments.find().count() == 0
    departments = [
      {
        'name': 'department 1',
        'description': 'dep1',
        'deleted':0
      }
      {
        'name': 'department 2',
        'description': 'dep2',
        'deleted':0
      }
    ]
    departments.forEach (department) ->
      Departments.insert department