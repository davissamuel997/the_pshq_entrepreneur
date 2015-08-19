ThePshqEntrepreneur.controller 'PodcastsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'PodcastsService', ($scope, $http, $location, $state, $stateParams, ngAudio, PodcastsService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    audio: null

    current_page: 1

    pagination: null

    podcasts: []

    selectedPodcast: null

    changePage: (page_number) ->
      this.current_page = page_number
      this.getPodcasts()

    getPodcasts: ->
      PodcastsService.getPodcasts.query({ page: this.current_page }, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.podcasts = responseData.podcasts
          $scope.requestControl.pagination = responseData.pagination
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
################# Index State ##################################

  if currentState() == 'index'
    $scope.requestControl.getPodcasts()

]