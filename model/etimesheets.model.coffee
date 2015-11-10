@Etimesheets = new Mongo.Collection('etimesheets')

Etimesheets.allow
  insert: (userId, etimesheet) ->
    true
  update: (userId, etimesheet, fields, modifier) ->
    true
  remove: (userId, etimesheet) ->
    true
