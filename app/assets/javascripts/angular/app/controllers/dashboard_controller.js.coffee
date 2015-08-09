ThePshqEntrepreneur.controller 'DashboardController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', ($scope, $http, $location, $state, $stateParams, ngAudio) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    getProgressBarWidth: ->
      if $scope.audio && $scope.audio.progress
        progress = $scope.audio.progress * 100

        return progress + '%'

  }

################################################################
################# Initialize ###################################

  init()

################################################################
################# Dashboard State ##############################

  if currentState() == 'dashboard'
    $scope.audio = ngAudio.load("http://s3.amazonaws.com/pshq-podcasts/podcasts/recordings/000/000/004/original/show.mp3?1439150599");
]