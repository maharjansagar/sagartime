'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'designations-list',
    url: '/designations'
    templateUrl: 'client/designations/designations-list.view.html'
    controller: 'DesignationsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]

  .state 'designation-detail',
    url: '/designations/:designationId'
    templateUrl: 'client/designations/designation-detail.view.html'
    controller: 'DesignationDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ] 

  .state 'designation-display',
    url: '/design'
    templateUrl: 'client/designations/designation-display.view.html'
    controller: 'DesignationDisplayCtrl'
       
