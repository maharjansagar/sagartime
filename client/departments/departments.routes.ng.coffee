'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'departments-list',
    url: '/departments'
    templateUrl: 'client/departments/departments-list.view.html'
    controller: 'DepartmentsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin")
             return true;
           return 'UNAUTHORIZED'
          )
        ]    
  .state 'department-detail',
    url: '/departments/:departmentId'
    templateUrl: 'client/departments/department-detail.view.html'
    controller: 'DepartmentDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin")
             return true;
           return 'UNAUTHORIZED'
         )
      ]  

  .state 'departments',
    url: '/depart'
    templateUrl: 'client/departments/departments.view.html'
    controller: 'DepartmentsCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser((user)->
          if(user.profile[0].role=="admin")
             return true;
           return 'UNAUTHORIZED'
         )
      ]   
