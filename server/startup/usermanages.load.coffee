Meteor.startup ->
  if Usermanages.find().count() == 0
    usermanages = [
      {
        'name': 'usermanage 1'
      }
      {
        'name': 'usermanage 2'
      }
    ]
    usermanages.forEach (usermanage) ->
      Usermanages.insert usermanage