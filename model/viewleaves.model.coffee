@Viewleaves = new Mongo.Collection('viewleaves')

Viewleaves.allow
  insert: (userId, viewleafe) ->
    true
  update: (userId, viewleafe, fields, modifier) ->
    true
  remove: (userId, viewleafe) ->
    true
