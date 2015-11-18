'use strict'

angular.module 'etimesApp'
.controller 'UsermanagesListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {'profile.fname' : 1}
  $scope.orderProperty = '1'
  
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.usermanagesCount = $scope.$meteorObject Counts, 'numberOfUsers', false
  
  # $scope.usermanages = $scope.$meteorCollection () ->
  #   Usermanages.find {}, {sort:$scope.getReactively('sort')}
  # $meteor.autorun $scope, () ->
  #   $scope.$meteorSubscribe('usermanages', {
  #     limit: parseInt($scope.getReactively('perPage'))
  #     skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
  #     sort: $scope.getReactively('sort')
  #   }, $scope.getReactively('search')).then () ->
  #     $scope.usermanagesCount = $scope.$meteorObject Counts, 'numberOfUsermanages', false

  $meteor.session 'usermanagesCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.usermanages.save $scope.newUsermanage
      $scope.newUsermanage = undefined
      
  $scope.remove = (user) ->
    Meteor.call('remove', user)
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = {'profile.fname': parseInt($scope.orderProperty)}
