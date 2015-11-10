@Usermanages = new Mongo.Collection('usermanages')

Usermanages.allow
  insert: (userId, usermanage) ->
    true
  update: (userId, usermanage, fields, modifier) ->
    true
  remove: (userId, usermanage) ->
    true
