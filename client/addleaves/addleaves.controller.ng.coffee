'use strict'

angular.module 'etimesApp'
.controller 'AddleavesCtrl', ($scope, $meteor, $state, $stateParams) ->
  $scope.viewName = 'Addleaves'

  $scope.addleaves = $scope.$meteorCollection () ->
    Addleaves.find { $and: [{'approved': 1},{'deleted': 0}]}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('addleaves')

  $scope.save = () ->
    $scope.newAddleave.approved=0
    $scope.newAddleave.deleted=0
    $scope.newAddleave.user= $scope.currentUser.emails[0].address
    $scope.addleaves.save $scope.newAddleave
    $scope.newAddleave
    $state.go 'userdashs'

  $scope.remove = (addleaveId) ->
    Meteor.call('addleaveDelete', addleaveId)
  