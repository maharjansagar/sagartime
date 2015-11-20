angular.module 'etimesApp'
.controller 'VerifiedCtrl', ($scope, $stateParams, $meteor, $state, $mdToast) ->

  $scope.user = $scope.$meteorObject Meteor.users, $stateParams.user

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {}

  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')
  
  $scope.remove = () ->
    Meteor.call('verifyEmail',$stateParams.token)
    $state.go 'logins'
    $mdToast.show($mdToast.simple().content('Email Verified').position('top', 'left').hideDelay(2000))