ThePshqEntrepreneur.controller 'PodcastsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'PodcastsService', '$sce', ($scope, $http, $location, $state, $stateParams, ngAudio, PodcastsService, $sce) ->

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

      episode_number: null

      name: null

      summary: null

    }

    podcast: null

    podcasts: []

    selectedPodcast: null

    widgitDescription: null

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
            $scope.requestControl.params.summary = responseData.podcast.summary
            $scope.requestControl.params.episode_number = responseData.podcast.episode_number

            if responseData.podcast.description && responseData.podcast.description.length > 0
              $scope.requestControl.widgitDescription = $sce.trustAsHtml(responseData.podcast.description)

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

    reInitializePodcast: ->
      this.params.air_date = null

      this.params.episode_number = null

      this.params.name = null

      this.params.summary = null

      this.widgitDescription = null

      this.podcast = null

    updatePodcast: ->
      if this.podcast && this.podcast.podcast_id && parseInt(this.podcast.podcast_id, 10) > 0
        PodcastsService.updatePodcast.query({ podcast_id: this.podcast.podcast_id, podcast_params: this.params, description: this.widgitDescription }, (responseData) ->
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
    $scope.requestControl.reInitializePodcast()
    $scope.requestControl.getPodcasts()

################################################################
################# Show State ###################################

  if currentState() == 'show_podcast'
    $scope.requestControl.reInitializePodcast()

    $scope.requestControl.findPodcast()
    $scope.requestControl.getPodcasts()

################################################################
################# Edit State ###################################

  if currentState() == 'edit_podcast'
    $scope.requestControl.reInitializePodcast()

    $scope.requestControl.findPodcast()

]