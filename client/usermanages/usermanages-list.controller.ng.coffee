'use strict'

angular.module 'etimesApp'
.controller 'UsermanagesListCtrl', ($scope, $meteor, $mdToast, $mdDialog, $mdSidenav) ->
  $scope.status = ''
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {'profile.fname' : 1}
  $scope.orderProperty = '1'

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return
  
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
      $mdToast.show($mdToast.simple().content('Remove Sucessfully').position('top', 'left').hideDelay(2000))
      $scope.status = 'You decided to get rid of your debt.'
      return
    ), ->
      $scope.status = 'You decided to keep your debt.'
      return
    return

  $scope.activate = (ev, user) ->
    if ($scope.currentUser.profile[0].isActive == 0)
      confirm = $mdDialog.confirm().title('Would you like to activate this user?').content('Are you sure you want to activate this user?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
      $mdDialog.show(confirm).then ->
        Meteor.call('active', user)
        $mdToast.show $mdToast.simple().content('Activate Sucessfully').position('top', 'left').hideDelay(2000)
        return
    else
      confirm = $mdDialog.confirm().title('Would you like to de-activate this user?').content('Are you sure you want to de-activate this user?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
      $mdDialog.show(confirm).then ->
        Meteor.call('deactive', user)
        $mdToast.show $mdToast.simple().content('Deactivate Sucessfully').position('top', 'left').hideDelay(2000)
        return
    return

  # $scope.activate = (ev, user) ->
  #   confirm = $mdDialog.confirm().title('Would you like to activate this user?').content('Are you sure you want to activate this user?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
  #   $mdDialog.show(confirm).then ( ->
  #     if ($scope.currentUser.profile[0].isActive == 0)
  #       Meteor.call('active', user)
  #     else
  #       Meteor.call('deactive', user)
  #     $mdToast.show($mdToast.simple().content('Activate Sucessfully').position('top', 'left').hideDelay(2000))
  #     $scope.status = 'You decided to get rid of your debt.'
  #     return
  #   ), ->
  #     $scope.status = 'You decided to keep your debt.'
  #     return
  #   return

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


