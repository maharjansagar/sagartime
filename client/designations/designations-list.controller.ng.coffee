'use strict'

angular.module 'etimesApp'
.controller 'DesignationsListCtrl', ($scope, $meteor) ->
  $scope.deleted=0
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {name : 1}
  $scope.orderProperty = '1'
  
  $scope.designations = $scope.$meteorCollection () ->
    Designations.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('designations', {
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.designationsCount = $scope.$meteorObject Counts, 'numberOfDesignations', false

  $meteor.session 'designationsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newDesignation.deleted=0
      $scope.designations.save $scope.newDesignation
      $scope.newDesignation = undefined
      
  $scope.remove = (designationId) ->
    Meteor.call('desigDelete', designationId)
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {name: parseInt($scope.orderProperty)}
