'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/main'
    templateUrl: 'client/main/main.view.html'
    controller: 'MainCtrl'

  .state 'dashboard',
    url: '/dashboard'
    resolve:
      currentUser: ['$meteor','$state', ($meteor,$state) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role == "admin") 
             return $state.go 'admindashs'
           return $state.go 'userdashs'
         )
      ]  
