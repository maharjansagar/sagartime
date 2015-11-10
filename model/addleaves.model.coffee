@Addleaves = new Mongo.Collection('addleaves')

Addleaves.allow
  insert: (userId, addleafe) ->
    true
  update: (userId, addleafe, fields, modifier) ->
    true
  remove: (userId, addleafe) ->
    true
