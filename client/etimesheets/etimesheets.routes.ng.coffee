'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'etimesheets',
    url: '/etimesheets'
    templateUrl: 'client/etimesheets/etimesheets.view.html'
    controller: 'EtimesheetsCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return false;
           return 'UNAUTHORIZED'
         )
      ]
