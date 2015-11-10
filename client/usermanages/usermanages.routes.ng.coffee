'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'usermanages-list',
    url: '/usermanages'
    templateUrl: 'client/usermanages/usermanages-list.view.html'
    controller: 'UsermanagesListCtrl'
  .state 'usermanage-detail',
    url: '/usermanages/:usermanageId'
    templateUrl: 'client/usermanages/usermanage-detail.view.html'
    controller: 'UsermanageDetailCtrl'
