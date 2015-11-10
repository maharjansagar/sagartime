'use strict'

angular.module 'etimesApp'
.controller 'OrganizationDetailCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.organization = $scope.$meteorObject Organizations, $stateParams.organizationId
  $scope.$meteorSubscribe('organizations')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.organization.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
          $state.go 'organizations-list'
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.organization.reset()
