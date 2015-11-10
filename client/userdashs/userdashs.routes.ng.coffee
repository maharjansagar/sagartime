'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'userdashs',
    url: '/userdashs'
    templateUrl: 'client/userdashs/userdashs.view.html'
    controller: 'UserdashsCtrl'
