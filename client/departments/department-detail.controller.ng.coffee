'use strict'

angular.module 'etimesApp'
.controller 'DepartmentDetailCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.department = $scope.$meteorObject Departments, $stateParams.departmentId
  $scope.$meteorSubscribe('departments')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.department.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
          $state.go 'departments-list'
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.department.reset()
