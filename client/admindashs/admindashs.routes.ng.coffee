'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admindashs',
    url: '/admindashs'
    templateUrl: 'client/admindashs/admindashs.view.html'
    controller: 'AdmindashsCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]