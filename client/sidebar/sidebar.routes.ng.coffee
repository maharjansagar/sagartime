'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'sidebar',
    url: '/sidebar'
    templateUrl: 'client/sidebar/sidebar.view.html'
    controller: 'SidebarCtrl'
