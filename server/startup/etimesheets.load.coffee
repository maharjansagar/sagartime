Meteor.startup ->
  if Etimesheets.find().count() == 0
    etimesheets = [
      {
        'name': 'etimesheet 1'
      }
      {
        'name': 'etimesheet 2'
      }
    ]
    etimesheets.forEach (etimesheet) ->
      Etimesheets.insert etimesheet