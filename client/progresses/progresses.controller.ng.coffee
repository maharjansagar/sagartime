'use strict'

angular.module 'etimesApp'
.controller 'ProgressesCtrl', ($scope, $meteor, $mdDialog, $mdToast) ->
  $scope.viewName = 'Progresses'

  $scope.page = 1
  $scope.perPage = 5
  $scope.sort = {user : 1}
  $scope.orderProperty = '1'

  $scope.etimesheets=$scope.$meteorCollection () ->
   Etimesheets.find {'deleted':0}, {sort:$scope.getReactively('sort')} 
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('etimesheets', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.etimesheetsCount = $scope.$meteorObject Counts, 'numberOfEtimesheets', false

  $scope.showConfirm = (ev, etimesheetId) ->
    # Appending dialog to document.body to cover sidenav in docs app
    confirm = $mdDialog.confirm().title('Would you like to remove this work flow?').content('Are you sure you want to remove this work flow?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
    $mdDialog.show(confirm).then ( ->
      Meteor.call('etimesheetDelete', etimesheetId)
      $mdToast.show($mdToast.simple().content('Remove Sucessfully').position('top', 'left').hideDelay(2000))
      $scope.status = 'You decided to get rid of your debt.'
      return
    ), ->
      $scope.status = 'You decided to keep your debt.'
      return
    return

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {user: parseInt($scope.orderProperty)}