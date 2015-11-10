'use strict'

angular.module 'etimesApp'
.controller 'AdminresetsCtrl', ($scope, $stateParams, $meteor) ->
  $scope.viewName = 'Adminresets'

  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.userId}
  $scope.email=$scope.user[0].emails[0].address

  $scope.resetpw = () ->
    console.log($stateParams.userId)
    Meteor.call('resetpw', $stateParams.userId, $scope.newPlaintextPassword)
    console.log('success')
