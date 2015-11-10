@Designations = new Mongo.Collection('designations')

Designations.allow
  insert: (userId, designation) ->
    true
  update: (userId, designation, fields, modifier) ->
    true
  remove: (userId, designation) ->
    true
