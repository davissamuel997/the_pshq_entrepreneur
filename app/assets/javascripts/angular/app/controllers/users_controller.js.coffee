ThePshqEntrepreneur.controller 'UsersController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'DashboardService', ($scope, $http, $location, $state, $stateParams, ngAudio, DashboardService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

  }

################################################################
################# Initialize ###################################

  init()

]