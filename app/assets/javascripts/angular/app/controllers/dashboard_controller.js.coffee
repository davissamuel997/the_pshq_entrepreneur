ThePshqEntrepreneur.controller 'DashboardController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'DashboardService', ($scope, $http, $location, $state, $stateParams, ngAudio, DashboardService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    audio: null

    podcasts: []

    selectedPodcast: null

    getPodcasts: ->
      DashboardService.getPodcasts.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.podcasts = responseData.podcasts
      )

    getProgressBarWidth: ->
      if $scope.audio && $scope.audio.progress
        progress = $scope.audio.progress * 100

        return progress + '%'

    loadPodcast: (podcast) ->
      if podcast && podcast.recording && podcast.recording.length > 0
        this.selectedPodcast = podcast
        $scope.audio = ngAudio.load(this.selectedPodcast.recording)

        debugger;

  }

################################################################
################# Initialize ###################################

  init()

################################################################
################# Dashboard State ##############################

  if currentState() == 'dashboard'
    $scope.requestControl.getPodcasts()

    # $scope.audio = ngAudio.load("http://s3.amazonaws.com/pshq-podcasts/podcasts/recordings/000/000/004/original/show.mp3?1439150599");
]