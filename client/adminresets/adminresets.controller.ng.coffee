'use strict'

angular.module 'etimesApp'
.controller 'AdminresetsCtrl', ($scope, $stateParams, $meteor, $mdToast, $mdDialog, $state) ->
  $scope.viewName = 'Adminresets'

  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.userId}
  $scope.email=$scope.user[0].emails[0].address

  # $scope.resetpw = () ->
  #   console.log($stateParams.userId)
  #   Meteor.call('resetpw', $stateParams.userId, $scope.newPlaintextPassword)
  #   console.log('success')

  $scope.showConfirm = (ev) ->
    # Appending dialog to document.body to cover sidenav in docs app
    confirm = $mdDialog.confirm().title('Would you like to change this user password?').content('Are you sure you want to change this user password?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
    $mdDialog.show(confirm).then ( ->
      Meteor.call('resetpw', $stateParams.userId, $scope.newPlaintextPassword)
      $mdToast.show($mdToast.simple().content('Change Sucessfully').position('top', 'left').hideDelay(2000))
      $state.go 'usermanages-list'
      $scope.status = 'You decided to get rid of your debt.'
      return
    ), ->
      $scope.status = 'You decided to keep your debt.'
      return
    return