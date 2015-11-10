Meteor.startup ->
  if Viewleaves.find().count() == 0
    viewleaves = [
      {
        'name': 'viewleafe 1'
      }
      {
        'name': 'viewleafe 2'
      }
    ]
    viewleaves.forEach (viewleafe) ->
      Viewleaves.insert viewleafe