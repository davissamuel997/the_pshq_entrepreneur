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

    currentUser: null

    newComment: null

    pagination: null

    params: {

      air_date: null

      description: null

      name: null

    }

    podcast: null

    podcasts: []

    selectedPodcast: null

    cancel: ->
      if this.podcast && this.podcast.podcast_id && parseInt(this.podcast.podcast_id, 10) > 0
        $location.path '/podcasts/' + this.podcast.podcast_id
      else
        $location.path '/podcasts'

    changePage: (page_number) ->
      this.current_page = page_number
      this.getPodcasts()

    findPodcast: ->
      if $stateParams["podcast_id"] && parseInt($stateParams["podcast_id"], 10) > 0
        PodcastsService.findPodcast.query({ podcast_id: $stateParams["podcast_id"] }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.podcast = responseData.podcast
            $scope.requestControl.currentUser = responseData.current_user

            $scope.requestControl.params.name = responseData.podcast.name
            $scope.requestControl.params.air_date = responseData.podcast.air_date
            $scope.requestControl.params.description = responseData.podcast.description

            $scope.requestControl.audio = ngAudio.load($scope.requestControl.podcast.recording)
        )

    getPodcasts: ->
      PodcastsService.getPodcasts.query({ page: this.current_page }, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.podcasts = responseData.podcasts
          $scope.requestControl.pagination = responseData.pagination
      )

    postComment: ->
      if this.podcast.podcast_id && parseInt(this.podcast.podcast_id, 10) > 0 && this.newComment && this.newComment.length > 0 && this.currentUser
        PodcastsService.createComment.query({ podcast_id: this.podcast.podcast_id, comment_description: this.newComment }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.podcast.comments = responseData.comments
        )

    updatePodcast: ->
      if this.podcast && this.podcast.podcast_id && parseInt(this.podcast.podcast_id, 10) > 0
        PodcastsService.updatePodcast.query({ podcast_id: this.podcast.podcast_id, podcast_params: this.params }, (responseData) ->
          if responseData.errors == false
            $location.path '/podcasts/' + $scope.requestControl.podcast.podcast_id
        )

  }

  $scope.$on("$destroy", ->
    if $scope.requestControl.audio
      $scope.requestControl.audio.pause()
      $scope.requestControl.audio = null
  )

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
  	$scope.requestControl.getPodcasts()

################################################################
################# Edit State ###################################

  if currentState() == 'edit_podcast'
  	$scope.requestControl.findPodcast()

]