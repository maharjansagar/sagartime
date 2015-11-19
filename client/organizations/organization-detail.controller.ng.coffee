'use strict'

angular.module 'etimesApp'
.controller 'OrganizationDetailCtrl', ($scope, $stateParams, $meteor, $state, $mdToast) ->
  $scope.organization = $scope.$meteorObject Organizations, $stateParams.organizationId
  $scope.$meteorSubscribe('organizations')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.organization.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
          $mdToast.show($mdToast.simple().content('Save Sucessfully').position('top', 'left').hideDelay(2000))
          $state.go 'organizations-list'
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.organization.reset()
