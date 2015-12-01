'use strict'

angular.module 'etimesApp'
.controller 'UserdashsCtrl', ($scope, $mdSidenav) ->
  $scope.viewName = 'Userdashs'

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return

