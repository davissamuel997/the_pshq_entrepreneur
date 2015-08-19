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

    podcast: null

    podcasts: []

    selectedPodcast: null

    changePage: (page_number) ->
      this.current_page = page_number
      this.getPodcasts()

    findPodcast: ->
    	if $stateParams["podcast_id"] && parseInt($stateParams["podcast_id"], 10) > 0
    		PodcastsService.findPodcast.query({ podcast_id: $stateParams["podcast_id"] }, (responseData) ->
    			if responseData.errors == false
    				$scope.requestControl.podcast = responseData.podcast

    				$scope.audio = ngAudio.load($scope.requestControl.podcast.recording)
    		)

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

  if currentState() == 'index_podcasts'
    $scope.requestControl.getPodcasts()

################################################################
################# Show State ###################################

  if currentState() == 'show_podcast'
  	$scope.requestControl.findPodcast()

]