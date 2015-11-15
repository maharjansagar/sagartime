'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'organizations-list',
    url: '/organizations'
    templateUrl: 'client/organizations/organizations-list.view.html'
    controller: 'OrganizationsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user._id=="BhwRmjwMgsr7FtSSX") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]    
  .state 'organization-detail',
    url: '/organizations/:organizationId'
    templateUrl: 'client/organizations/organization-detail.view.html'
    controller: 'OrganizationDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user._id=="BhwRmjwMgsr7FtSSX") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]