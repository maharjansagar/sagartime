'use strict'

angular.module 'etimesApp'
.controller 'EtimesheetsCtrl', ($scope, $meteor, $state, $rootScope, $mdSidenav) ->
  $scope.viewName = 'Etimesheets'

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return


  $scope.tables = []
  console.log($scope.tables)
  $scope.etimesheets=$scope.$meteorCollection () ->
   Etimesheets.find {}, {sort:$scope.getReactively('sort')} 
  console.log($scope.etimesheets)
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('etimesheets')

  $scope.projects = $scope.$meteorCollection () ->
    Projects.find { $and: [{"deleted":0},{"member":Meteor.userId()}]}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('projects', {
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.projectsCount = $scope.$meteorObject Counts, 'numberOfProjects', false


  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

    $scope.set=(name)->
    $scope.pname=name
    console.log($scope.name)

  $scope.addRow = () ->
    $scope.tables.push({pname:$scope.newEtimesheet.name,ptime:$scope.newEtimesheet.time,pdetails:$scope.newEtimesheet.details,user:$rootScope.currentUser.emails[0].address,deleted:0,createdDate:new Date()})
    $scope.newEtimesheet=undefined
   
  $scope.save = () ->
    $scope.newEtimesheet=$scope.tables
    $scope.etimesheets.save $scope.newEtimesheet
    $scope.newEtimesheet = undefined
    $scope.tables = undefined
    $scope.tables = [] 
    console.log='success'
    

   $scope.set=(name)->
    $scope.pname=name

  # $scope.addRow = () ->
  #   $scope.tables.push({pname:$scope.newEtimesheet.name,ptime:$scope.newEtimesheet.time,pdetails:$scope.newEtimesheet.details,user:$rootScope.currentUser.emails[0].address,deleted:$scope.Etimesheet.deleted,createdDate:new Date()})
  #   $scope.newEtimesheet=undefined