'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'viewleaves',
    url: '/viewleaves'
    templateUrl: 'client/viewleaves/viewleaves.view.html'
    controller: 'ViewleavesCtrl'
  .state 'editleave',
    url: '/viewleaves/:addleaveId'
    templateUrl: 'client/viewleaves/editleave.view.html'
    controller: 'EditleavesCtrl'
