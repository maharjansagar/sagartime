'use strict'

angular.module 'etimesApp'
.controller 'AdmindashsCtrl', ($scope, $mdSidenav, $mdDialog) ->
  $scope.viewName = 'Admindashs'

  $scope.toggleSidenav = (menuId) ->
    $mdSidenav(menuId).toggle()
    return

  $scope.showAdd = (ev) ->
    $mdDialog.show(
      controller: DialogController
      template: '<md-dialog aria-label="Mango (Fruit)"> <md-content class="md-padding"> <form name="userForm"> <div layout layout-sm="column"> <md-input-container flex> <label>First Name</label> <input ng-model="user.firstName" placeholder="Placeholder text"> </md-input-container> <md-input-container flex> <label>Last Name</label> <input ng-model="theMax"> </md-input-container> </div> <md-input-container flex> <label>Address</label> <input ng-model="user.address"> </md-input-container> <div layout layout-sm="column"> <md-input-container flex> <label>City</label> <input ng-model="user.city"> </md-input-container> <md-input-container flex> <label>State</label> <input ng-model="user.state"> </md-input-container> <md-input-container flex> <label>Postal Code</label> <input ng-model="user.postalCode"> </md-input-container> </div> <md-input-container flex> <label>Biography</label> <textarea ng-model="user.biography" columns="1" md-maxlength="150"></textarea> </md-input-container> </form> </md-content> <div class="md-actions" layout="row"> <span flex></span> <md-button ng-click="answer(\'not useful\')"> Cancel </md-button> <md-button ng-click="answer(\'useful\')" class="md-primary"> Save </md-button> </div></md-dialog>'
      targetEvent: ev).then ((answer) ->
      $scope.alert = 'You said the information was "' + answer + '".'
      return
    ), ->
      $scope.alert = 'You cancelled the dialog.'
      return
    return

DialogController = ($scope, $mdDialog) ->

  $scope.hide = ->
    $mdDialog.hide()
    return

  $scope.cancel = ->
    $mdDialog.cancel()
    return

  $scope.answer = (answer) ->
    $mdDialog.hide answer
    return

  return

  $scope.listItemClick = ($index) ->
    clickedItem = $scope.items[$index]
    $mdBottomSheet.hide clickedItem
    return

  return