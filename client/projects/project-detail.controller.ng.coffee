'use strict'

angular.module 'etimesApp'
.controller 'ProjectDetailCtrl', ($scope, $stateParams, $meteor, $mdToast,$state, $mdSidenav) ->
  
  $scope.indexesindexesindexes = 0

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return


  $scope.project = $scope.$meteorObject Projects, $stateParams.projectId
  $scope.$meteorSubscribe('projects')

  
  console.log($scope.projects)  
  $scope.project = $scope.$meteorObject Projects, $stateParams.projectId

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')


  $scope.member=$scope.project.member
   

  $meteor.session 'projectsCounter'
  .bind $scope, 'page'

  $scope.shouldBeDisabled= (users)->
    if(users== '1')
      return true
    else
      return false
  
  $scope.exists=(users,list)->
    return list.indexOf(users) > -1

  $scope.toggle =  (users, list)->
    $scope.indexes = list.indexOf(users)
    if($scope.indexes> -1)
     list.splice($scope.indexes, 1)
    else
     list.push(users)
    
  # $scope.save = () ->
  #   $scope.project.deleted=0
  #   $scope.project.member=$scope.member
  #   console.log($scope.member)
  #   $scope.projects.save $scope.project
  #   $scope.project = undefined
  #   alert('Project Saved') 
  #   document.getElementById("form").reset()
  #   $scope.member=[]
  #   $scope.indexes=0 

  $scope.save = () ->
    if $scope.form.$valid
      $scope.project.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
          $mdToast.show($mdToast.simple().content('Save Sucessfully').position('top', 'left').hideDelay(2000))
          $state.go 'projects-list'
        (error) ->
          console.log 'save error ', error
      )
  

  $scope.remove = (projectId) ->
    Meteor.call('projectDelete', projectId)