'use strict'

angular.module 'etimesApp'
.controller 'RegistersCtrl', ($scope, $state, $meteor) ->
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
    deleted:'0'
  ]
  $scope.error=''
  console.log($scope.profile[0].deleted)

  $scope.user = $scope.$meteorCollection ()->
    Meteor.users.find {}

  $scope.register = ->
    Accounts.createUser({email:$scope.email,password:$scope.password,profile:$scope.profile}, (error)->
      if($scope.password == $scope.repassword)
        if(error)
          console.log(error)
        else
          console.log('success')
          $scope.verificationState = $scope.user[0].emails[0].verified
          console.log('verified state')
          $scope.emailToVerify = $scope.user[0].emails[0].address
          if($scope.verificationState==false)
            Meteor.call('chckEmail',Meteor.userId(),$scope.emailToVerify)
            $state.go('not-verified',{userId: Meteor.userId()})
          else
            console.log('success')
            $state.go('logins')
      else
        alert('Password not matched')
    )
  # $scope.register = () ->
  #     if($scope.password==$scope.repassword)
  #       console.log("correct")
  #       Accounts.createUser({email:$scope.email, password:$scope.password, profile:$scope.profile}, (error)->
  #           if(error)
  #             console.log(error)
  #           else
  #             console.log('success')
  #             $scope.verificationState = $scope.user[0].emails[0].verified
  #             console.log('verified state')
  #             $scope.emailToVerify = $scope.user[0].emails[0].address
  #             if($scope.verificationState==false)
  #               Meteor.call('chkEmailVerify',Meteor.userId(),$scope.emailToVerify)
  #               $state.go('not-verified',{userId: Meteor.userId()})
  #             else
  #               $state.go('main')
  #         )
  #     else
  #       console.log("not match")  
  #       alert("pasword doesnt match")
  #     )
