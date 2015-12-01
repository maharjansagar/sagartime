'use strict'

angular.module 'etimesApp'
.config ($mdThemingProvider) ->
  $mdThemingProvider.theme('default')
  .primaryPalette('blue')
  .accentPalette('light-blue')
