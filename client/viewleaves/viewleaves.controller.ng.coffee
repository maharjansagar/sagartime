'use strict'

angular.module 'etimesApp'
.controller 'ViewleavesCtrl', ($scope, $meteor) ->
  $scope.viewName = 'Viewleaves'

  $scope.addleaves = $scope.$meteorCollection () ->
    Addleaves.find { $and: [{'approved': 0}, {'deleted':0}]}, {sort:$scope.getReactively('sort')} 
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('addleaves')

  $scope.approve = (addleaveId) ->
    Meteor.call('addleaveApprove',addleaveId)

  $scope.remove= (addleaveId) ->
    Meteor.call('addleaveDelete', addleaveId)