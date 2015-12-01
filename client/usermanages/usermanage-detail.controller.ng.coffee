'use strict'

angular.module 'etimesApp'
.controller 'UsermanageDetailCtrl', ($scope, $stateParams, $meteor, $state, $mdToast, $mdSidenav) ->
  console.log $stateParams.usermanageId

  $scope.user = $scope.$meteorCollection () ->
    Meteor.users.find {'_id':$stateParams.usermanageId}
  $scope.fname=$scope.user[0].profile[0].fname
  $scope.mname=$scope.user[0].profile[0].mname
  $scope.lname=$scope.user[0].profile[0].lname
  $scope.mcontact=$scope.user[0].profile[0].mcontact
  $scope.email=$scope.user[0].emails[0].address
  $scope.department=$scope.user[0].profile[0].department
  $scope.designation=$scope.user[0].profile[0].designation

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return

  
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

  $scope.departments = $scope.$meteorCollection () ->
    Departments.find {'deleted':0}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('departments')

  $scope.designations = $scope.$meteorCollection () ->
    Designations.find {'deleted':0}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('designations')


  
  
  $scope.save = () ->
   Meteor.call('update',$stateParams.usermanageId,$scope.email,$scope.fname,$scope.mname,$scope.lname,$scope.mcontact,$scope.department,$scope.designation)
   $mdToast.show($mdToast.simple().content('Saved Sucessfully').position('top', 'left').hideDelay(2000))
   $state.go 'usermanages-list'

  $scope.reset = () ->
    $scope.user.reset()
