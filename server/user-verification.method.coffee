'use strict'

Meteor.methods
  resetpw:(userId, newPlaintextPassword) ->
    Accounts.setPassword(userId, newPlaintextPassword)