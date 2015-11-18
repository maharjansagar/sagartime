Meteor.startup ->
    
  if Meteor.users.find().count() == 0
    Accounts.createUser({
        email:'sagar@makeitsimple.info'
        password:'1234'
        profile:[{
            'fname' : 'Sagar'
            'mname' : ''
            'lname' : 'Maharjan'
            'contact': '9849709623'
            'address' : 'Gwarko'
            'deleted' : '1'
            'secondaryemail' : ''
            'role' : 'admin'
            }]
        stopActivationLink: true    
    })
    

  # if Meteor.users.find().count() == 0
  #   users = [
  #    {
  #       "_id" : "BhwRmjwMgsr7FtSSX",
  #       "services" : {
  #               "password" : {
  #                       "bcrypt" : "$2a$10$2HzzdQ95mtz/zP6q0PctdeRrwFfPMQyUM1ptaGsbZcpX5jCTph6mu"
  #               },
                
  #               "email" : {
  #                       "verificationTokens" : [ ]
  #               }
  #       },
  #       "emails" : [
  #               {
  #                       "address" : "shagarmaharjan@gmail.com",
  #                       "verified" : true
  #               }
  #       ],
  #       "profile" : [
  #               {
  #                       "fname" : "Sagar",
  #                       "mname" : "",
  #                       "lname" : "Maharjan",
  #                       "contact" : "98489999999",
  #                       "address" : "Gwarko",
  #                       "deleted" : 1,
  #                       "secondaryemail" : ""
  #                       "role":"admin"
  #               }
  #       ]
  #     }
  #   ]
  #   users.forEach (user) ->
  #     Meteor.users.insert user