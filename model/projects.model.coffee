@Projects = new Mongo.Collection('projects')

Projects.allow
  insert: (userId, project) ->
    true
  update: (userId, project, fields, modifier) ->
    true
  remove: (userId, project) ->
    true
