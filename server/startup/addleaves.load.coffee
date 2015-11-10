Meteor.startup ->
  if Addleaves.find().count() == 0
    addleaves = [
      {
        'name': 'addleafe 1'
      }
      {
        'name': 'addleafe 2'
      }
    ]
    addleaves.forEach (addleafe) ->
      Addleaves.insert addleafe