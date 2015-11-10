@Departments = new Mongo.Collection('departments')

Departments.allow
  insert: (userId, department) ->
    true
  update: (userId, department, fields, modifier) ->
    true
  remove: (userId, department) ->
    true
