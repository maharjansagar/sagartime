angular.module 'etimesApp'
.controller 'VerifiedCtrl', ($scope, $stateParams, $meteor, $state) ->

  $scope.user = $scope.$meteorCollection ()->
    Meteor.users.find {}
  
  $scope.remove = (userId) ->
    Meteor.call('emailVerify',userId)
    console.log('sucess')
    $state.go 'logins'