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
      else if($scope.currentUser.profile[0].isActive=='1' && $scope.currentUser.emails[0].verified==true && $scope.currentUser.profile[0].deleted=='0')
        $state.go 'userdashs'
      else
        $state.go 'not-verified'
    ), (err) ->
      $scope.error = 'Login error - ' + err
