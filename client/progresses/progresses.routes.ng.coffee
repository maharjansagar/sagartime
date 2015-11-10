'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'progresses',
    url: '/progresses'
    templateUrl: 'client/progresses/progresses.view.html'
    controller: 'ProgressesCtrl'
