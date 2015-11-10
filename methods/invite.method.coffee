'use strict'

Meteor.methods
  remove: (user) ->
    Meteor.users.update({_id: user},{$set:{'profile.0.deleted':'1'}})
    console.log('comes here')

  projectDelete:(projectId) ->
    Projects.update(projectId,{$set:{'deleted':1}})

  departmentDelete:(departmentId) ->
    Departments.update(departmentId,{$set:{'deleted':1}})

  desigDelete: (designationId) ->
    Designations.update(designationId,{$set:{'deleted':1}})

  organizationDelete: (organizationId) ->
    Organizations.update(organizationId,{$set:('deleted':1)})

  addleaveApprove: (addleaveId) ->
    Addleaves.update(addleaveId,{$set:('approved':1)}) 

  emailVerify: (userId) ->
    Meteor.users.update({userId},{$set:{"emails.0.verified":true}})

  addleaveDelete: (addleaveId) ->
    Addleaves.update(addleaveId,{$set:('deleted': 1)}) 

  update:(user,email,fname,mname,lname,mcontact) ->
    Meteor.users.update({ _id: user },{$set:{"emails.0.address":email}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.fname":fname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.mname":mname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.lname":lname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.mcontact":mcontact}})
