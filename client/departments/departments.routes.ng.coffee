'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'departments-list',
    url: '/departments'
    templateUrl: 'client/departments/departments-list.view.html'
    controller: 'DepartmentsListCtrl'
  .state 'department-detail',
    url: '/departments/:departmentId'
    templateUrl: 'client/departments/department-detail.view.html'
    controller: 'DepartmentDetailCtrl'
