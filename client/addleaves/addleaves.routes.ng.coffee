'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'addleaves',
    url: '/addleaves'
    templateUrl: 'client/addleaves/addleaves.view.html'
    controller: 'AddleavesCtrl'
