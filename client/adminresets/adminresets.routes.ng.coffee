'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'adminresets',
    url: '/adminresets/:userId'
    templateUrl: 'client/adminresets/adminresets.view.html'
    controller: 'AdminresetsCtrl'
