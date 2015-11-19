'use strict'

angular.module 'etimesApp'
.controller 'OrganizationsListCtrl', ($scope, $meteor, $mdToast, $mdDialog) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {name : 1}
  $scope.orderProperty = '1'
  
  $scope.organizations = $scope.$meteorCollection () ->
    Organizations.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('organizations', {
      limit: parseInt($scope.getReactively('perPage'))
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
      $mdToast.show($mdToast.simple().content('Added Sucessfully').position('top', 'left').hideDelay(2000))
      
  $scope.showConfirm = (ev, organizationId) ->
    # Appending dialog to document.body to cover sidenav in docs app
    confirm = $mdDialog.confirm().title('Would you like to delete this organization?').content('Are you sure you want to remove this organization?').ariaLabel('Lucky day').targetEvent(ev).ok('Yes').cancel('No')
    $mdDialog.show(confirm).then ( ->
      Meteor.call('organizationDelete', organizationId)
      $mdToast.show($mdToast.simple().content('Remove Sucessfully').position('top', 'left').hideDelay(2000))
      $scope.status = 'You decided to get rid of your debt.'
      return
    ), ->
      $scope.status = 'You decided to keep your debt.'
      return
    return


  # $scope.remove = (organizationId) ->
  #   Meteor.call('organizationDelete',organizationId)
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {name: parseInt($scope.orderProperty)}
