'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'logins',
    url: '/'
    templateUrl: 'client/logins/logins.view.html'
    controller: 'LoginsCtrl'
  .state 'logout',
  url: '/logout'
  resolve: 'logout': ['$meteor', '$state'
   ($meteor, $state) ->
    $meteor.logout().then (->
     $state.go 'logins'
     return
    ), (err) ->
     console.log 'logout error - ', err
     return
   ]