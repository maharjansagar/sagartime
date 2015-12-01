'use strict'

angular.module 'etimesApp'
.controller 'OrganizationsListCtrl', ($scope, $meteor, $mdToast, $mdDialog, $mdSidenav) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {name : 1}
  $scope.orderProperty = '1'
  $scope.status = ''
  
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

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return

  $scope.showAdd = (ev) ->
    $mdDialog.show(
      controller: DialogController
      template: '<md-dialog aria-label="Mango (Fruit)"> <form ng-submit="save()" name="form" novalidate="" layout-padding="" class="md-whiteframe-z1">
  <md-toolbar>
      <div class="md-toolbar-tools">
        <h2>Mango (Fruit)</h2>
        <span flex></span>
        <md-button class="md-icon-button" ng-click="cancel()">
          <md-icon class="fa fa-times" aria-label="Close dialog"></md-icon>
        </md-button>
      </div>
    </md-toolbar>
  <p>Add a organization</p>
  <md-input-container>
    <label>Name</label>
    <input ng-model="newOrganization.name" placeholder="Name"/>
  </md-input-container>
  <md-input-container>
    <label>Address</label>
    <input ng-model="newOrganization.address" placeholder="Address"/>
  </md-input-container>
  <md-input-container>
    <label>Contact</label>
    <input ng-model="newOrganization.contact" placeholder="Contact"/>
  </md-input-container>
  <md-input-container>
    <label>Email Address</label>
    <input ng-model="newOrganization.email" placeholder="Email"/>
  </md-input-container>
  <input type="submit" value="Add" class="md-button"/>
</form></md-dialog>'
      targetEvent: ev).then ((answer) ->
      $scope.alert = 'You said the information was "' + answer + '".'
      return
    ), ->
      $scope.alert = 'You cancelled the dialog.'
      return
    return

DialogController = ($scope, $mdDialog) ->

  $scope.hide = ->
    $mdDialog.hide()
    return

  $scope.cancel = ->
    $mdDialog.cancel()
    return

  $scope.save = () ->
    if $scope.form.$valid
      $scope.newOrganization.deleted=0
      $scope.organizations.save $scope.newOrganization
      $scope.newOrganization = undefined
      $mdToast.show($mdToast.simple().content('Added Sucessfully').position('top', 'left').hideDelay(2000))
