'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'usermanages-list',
    url: '/usermanages'
    templateUrl: 'client/usermanages/usermanages-list.view.html'
    controller: 'UsermanagesListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user._id=="BhwRmjwMgsr7FtSSX") 
             return true;
           return 'UNAUTHORIZED'
         )
      ] 

         
  .state 'usermanage-detail',
    url: '/usermanages/:usermanageId'
    templateUrl: 'client/usermanages/usermanage-detail.view.html'
    controller: 'UsermanageDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user._id=="BhwRmjwMgsr7FtSSX") 
             return true;
           return 'UNAUTHORIZED'
         )
      ]    
