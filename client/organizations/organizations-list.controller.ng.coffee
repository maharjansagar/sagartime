'use strict'

angular.module 'etimesApp'
.controller 'OrganizationsListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 4
  $scope.sort = {name : 1}
  $scope.orderProperty = '1'
  
  $scope.organizations = $scope.$meteorCollection () ->
    Organizations.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('organizations', {
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.organizationsCount = $scope.$meteorObject Counts, 'numberOfOrganizations', false

  $meteor.session 'organizationsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.newOrganization.deleted=0
      $scope.organizations.save $scope.newOrganization
      $scope.newOrganization = undefined
      
  $scope.remove = (organizationId) ->
    Meteor.call('organizationDelete',organizationId)
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {name: parseInt($scope.orderProperty)}
