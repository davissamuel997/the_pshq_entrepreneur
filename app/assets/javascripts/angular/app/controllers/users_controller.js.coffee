ThePshqEntrepreneur.controller 'UsersController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'UsersService', ($scope, $http, $location, $state, $stateParams, ngAudio, UsersService) ->

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

################################################################
################# Meet the Hosts State #########################

  if currentState() == 'meet_the_hosts'
  	console.log("inside the hosts state")
]