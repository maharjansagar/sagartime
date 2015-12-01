'use strict'

angular.module 'etimesApp'
.controller 'DesignationDetailCtrl', ($scope, $stateParams, $meteor, $state, $mdSidenav) ->
  $scope.designation = $scope.$meteorObject Designations, $stateParams.designationId
  $scope.$meteorSubscribe('designations')

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return

  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.designation.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
          $state.go 'departments-list'
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.designation.reset()
