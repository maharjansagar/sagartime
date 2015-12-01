'use strict'

angular.module 'etimesApp'
.controller 'RegistersCtrl', ($scope, $state, $meteor, $mdToast) ->
  $scope.viewName = 'Registers'

  $scope.email=''
  $scope.password=''
  $scope.profile=[
    fname:'',
    mname:'',
    lname:'',
    mcontact:'',
    hcontact:'',
    semail:'',
    address:'',
    department:'',
    designation:'',
    deleted:'0'
    isActive:'0'
  ]
  $scope.error=''
  console.log($scope.profile[0].deleted)

  $scope.user = $scope.$meteorCollection ()->
    Meteor.users.find {}

  $scope.register = ->
    if($scope.password == $scope.repassword)
      Meteor.call('usercreate',$scope.email,$scope.password,$scope.profile)

    # Accounts.createUser({email:$scope.email,password:$scope.password,profile:$scope.profile}, (error)->
     
    #     Meteor.call('chckEmail',Meteor.userId(),$scope.emailToVerify)
    else
      $mdToast.show($mdToast.simple().content('password doesnt match')) 

