'use strict'

angular.module 'etimesApp'
.controller 'LoginsCtrl', ($scope, $state, $meteor) ->
  $scope.viewName = 'Logins'

  $scope.credentials =
    email: ''
    password: ''
  $scope.error = ''

  $scope.login = ()->
    $meteor.loginWithPassword($scope.credentials.email, $scope.credentials.password).then (->
      if($scope.currentUser.profile[0].role=="admin")
        $state.go 'admindashs'
      else
        $state.go 'userdashs'
    ), (err) ->
      $scope.error = 'Login error - ' + err
