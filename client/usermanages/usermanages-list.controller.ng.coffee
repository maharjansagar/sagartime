'use strict'

angular.module 'etimesApp'
.controller 'UsermanagesListCtrl', ($scope, $meteor, $mdToast, $mdDialog) ->
  $scope.status = ''
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {'profile.fname' : 1}
  $scope.orderProperty = '1'
  
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.usermanagesCount = $scope.$meteorObject Counts, 'numberOfUsers', false

  $scope.showConfirm = (ev, user) ->
    # Appending dialog to document.body to cover sidenav in docs app
    confirm = $mdDialog.confirm().title('Would you like to delete this user?').content('Are you sure you want to remove this user?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
    $mdDialog.show(confirm).then ( ->
      Meteor.call('remove', user)
      $mdToast.show($mdToast.simple().content('Remove Sucessfully'))
      $scope.status = 'You decided to get rid of your debt.'
      return
    ), ->
      $scope.status = 'You decided to keep your debt.'
      return
    return


  $meteor.session 'usermanagesCounter'
  .bind $scope, 'page'
    
  # $scope.save = () ->
  #   if $scope.form.$valid
  #     $scope.usermanages.save $scope.newUsermanage
  #     $scope.newUsermanage = undefined
      
  # $scope.remove = (user) ->
  #   Meteor.call('remove', user)
  #   $mdToast.show($mdToast.simple().content('Remove Sucessfully'))

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {'profile.fname': parseInt($scope.orderProperty)}
