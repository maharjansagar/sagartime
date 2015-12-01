'use strict'

angular.module 'etimesApp'
.controller 'AddleavesCtrl', ($scope, $meteor, $state, $stateParams, $mdSidenav) ->
  $scope.viewName = 'Addleaves'

  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {reason : 1}
  $scope.orderProperty = '1'

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return


  $scope.addleaves = $scope.$meteorCollection () ->
    Addleaves.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('addleaves', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.addleavesCount = $scope.$meteorObject Counts, 'numberOfAddleaves', false

  $scope.save = () ->
    $scope.newAddleave.approved=0
    $scope.newAddleave.deleted=0
    $scope.newAddleave.user= $scope.currentUser.emails[0].address
    $scope.addleaves.save $scope.newAddleave
    $scope.newAddleave
    $state.go 'userdashs'

  $scope.remove = (addleaveId) ->
    Meteor.call('addleaveDelete', addleaveId)

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {reason: parseInt($scope.orderProperty)}
  