@Organizations = new Mongo.Collection('organizations')

Organizations.allow
  insert: (userId, organization) ->
    true
  update: (userId, organization, fields, modifier) ->
    true
  remove: (userId, organization) ->
    true
