'use strict'

angular.module 'etimesApp'
.controller 'UsermanageDetailCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.usermanageId}
  $scope.fname=$scope.user[0].profile[0].fname
  $scope.mname=$scope.user[0].profile[0].mname
  $scope.lname=$scope.user[0].profile[0].lname
  $scope.mcontact=$scope.user[0].profile[0].mcontact
  $scope.email=$scope.user[0].emails[0].address


  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')
  
  $scope.save = () ->
   Meteor.call('update',$stateParams.usermanageId,$scope.email,$scope.fname,$scope.mname,$scope.lname,$scope.mcontact)
   $state.go 'usermanages-list'

  $scope.reset = () ->
    $scope.user.reset()
