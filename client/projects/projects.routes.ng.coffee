'use strict'

angular.module 'etimesApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'projects-list',
    url: '/projects'
    templateUrl: '\client/projects/projects-list.view.html'
    controller: 'ProjectsListCtrl'
  .state 'project-detail',
    url: '/projects/:projectId'
    templateUrl: '\client/projects/project-detail.view.html'
    controller: 'ProjectDetailCtrl'
