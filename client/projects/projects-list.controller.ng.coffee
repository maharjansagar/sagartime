'use strict'

angular.module 'etimesApp'
.controller 'ProjectsListCtrl', ($scope, $meteor, $state) ->
  $scope.member=[] 

  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {name : 1}
  $scope.orderProperty = '1'

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')
  
  $scope.projects = $scope.$meteorCollection () ->
    Projects.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('projects', {
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.projectsCount = $scope.$meteorObject Counts, 'numberOfProjects', false

  $meteor.session 'projectsCounter'
  .bind $scope, 'page'

  $scope.shouldBeDisabled= (users)->
    if(users== '1')
      return true
    else
      return false

  $scope.exist = (users, list) ->
    return list.indexOf(users) > -1

  $scope.toggle = (users, list) ->
    $scope.indexes = list.indexOf(users)
    if($scope.indexes > -1)
      list.splice($scope.indexes, 1)
    else
      list.push(users)
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newProject.deleted=0
      $scope.newProject.member=$scope.member
      $scope.projects.save $scope.newProject
      $scope.newProject = undefined
      document.getElementById('form').reset()
      $scope.member=[]
      $scope.idx=0
      
  $scope.remove = (projectId) ->
    Meteor.call('projectDelete',projectId)
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {name: parseInt($scope.orderProperty)}
