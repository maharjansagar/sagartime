'use strict'

Meteor.methods
  remove: (user) ->
    Meteor.users.update({_id: user},{$set:{'profile.0.deleted':'1'}})
    console.log('comes here')

  active: (user) ->
    Meteor.users.update({_id:user},{$set:{'profile.0.isActive': '1'}})

  deactive: (user) ->
    Meteor.users.update({_id:user},{$set:{'profile.0.isActive': '0'}})    

  etimesheetDelete:(etimesheetId) ->
    Etimesheets.update(etimesheetId,{'deleted':1})

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

  usercreate:(em,ps,pr)->
    uid=Accounts.createUser(email:em,password:ps,profile:pr)
    Accounts.sendVerificationEmail(uid,em)
    
  update:(user,email,fname,mname,lname,mcontact,department,designation) ->
    Meteor.users.update({ _id: user },{$set:{"emails.0.address":email}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.fname":fname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.mname":mname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.lname":lname}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.mcontact":mcontact}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.department":department}})
    Meteor.users.update({ _id: user },{$set:{"profile.0.designation":designation}})
