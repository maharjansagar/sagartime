'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'organizations-list',
    url: '/organizations'
    templateUrl: 'client/organizations/organizations-list.view.html'
    controller: 'OrganizationsListCtrl'
  .state 'organization-detail',
    url: '/organizations/:organizationId'
    templateUrl: 'client/organizations/organization-detail.view.html'
    controller: 'OrganizationDetailCtrl'
