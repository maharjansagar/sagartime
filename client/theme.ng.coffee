'use strict'

angular.module 'etimesApp'
.config ($mdThemingProvider) ->
  $mdThemingProvider.theme('default')
  .primaryPalette('deep-orange')
  .accentPalette('lime')
