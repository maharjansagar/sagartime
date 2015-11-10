'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'etimesheets',
    url: '/etimesheets'
    templateUrl: 'client/etimesheets/etimesheets.view.html'
    controller: 'EtimesheetsCtrl'
