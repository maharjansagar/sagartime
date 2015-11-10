'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admindashs',
    url: '/admindashs'
    templateUrl: 'client/admindashs/admindashs.view.html'
    controller: 'AdmindashsCtrl'
