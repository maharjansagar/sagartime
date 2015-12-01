'use strict'

angular.module 'etimesApp'
.controller 'ViewleavesCtrl', ($scope, $meteor, $mdToast, $mdDialog, $mdSidenav) ->
  $scope.viewName = 'Viewleaves'

  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {user : 1}
  $scope.orderProperty = '1'

  $scope.button = 'Not Approve'

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return

  
  $scope.addleaves = $scope.$meteorCollection () ->
    Addleaves.find {'deleted': 0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('addleaves', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.addleavesCount = $scope.$meteorObject Counts, 'numberOfAddleaves', false

  $scope.sagar = (sagar)->
    if (sagar == 1)
      $scope.button = 'Approved'
      console.log('come here')
    else
      $scope.button = 'Not Approve'
      console.log('fuck you')

  $scope.showConfirm = (ev, addleaveId) ->
    # Appending dialog to document.body to cover sidenav in docs app
    confirm = $mdDialog.confirm().title('Would you like to remove this leave request?').content('Are you sure you want to remove this leave request?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
    $mdDialog.show(confirm).then ( ->
      Meteor.call('addleaveDelete', addleaveId)
      $mdToast.show($mdToast.simple().content('Remove Sucessfully').position('top', 'left').hideDelay(2000))
      $scope.status = 'You decided to get rid of your debt.'
      return
    ), ->
      $scope.status = 'You decided to keep your debt.'
      return
    return

  # $scope.emp=$scope.$meteorCollection () ->
  #     Addleaves.find {'_id':userId}
  #   console.log($scope.emp[0].del)
  #   if($scope.emp[0].isActive==1)
  #     $mdToast.show($mdToast.simple().content('This user is already verified'))
  #   else
  #     Meteor.call('update11',userId)
  #     Meteor.call('update12',useradd)
  #    # Meteor.call('update13',useradd)
  #     $mdToast.show($mdToast.simple().content('user verified Sucessfully'))

  $scope.approve = (ev, addleaveId) ->   
    # Appending dialog to document.body to cover sidenav in docs app
    confirm = $mdDialog.confirm().title('Would you like to approve this leave request?').content('Are you sure you want to approve this leave request?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
    $mdDialog.show(confirm).then ( ->
      Meteor.call('addleaveApprove', addleaveId)
      $mdToast.show($mdToast.simple().content('Approved Leave').position('top', 'left').hideDelay(2000))
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