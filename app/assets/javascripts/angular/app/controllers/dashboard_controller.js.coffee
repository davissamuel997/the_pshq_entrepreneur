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

    posts: []

    selectedPodcast: null

    getPodcasts: ->
      DashboardService.getPodcasts.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.podcasts = responseData.podcasts
      )

    getPosts: ->
      DashboardService.getPosts.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.posts = responseData.posts
      )

    getProgressBarWidth: ->
      if $scope.audio && $scope.audio.progress
        progress = $scope.audio.progress * 100

        return progress + '%'

    loadPodcast: (podcast) ->
      if podcast && podcast.recording && podcast.recording.length > 0
        this.selectedPodcast = podcast
        $scope.audio = ngAudio.load(this.selectedPodcast.recording)
  }

  $scope.tabControl = {

    currentView: 'general'

    changeView: (newView) ->
      if newView && newView.length > 0
        this.currentView = newView

    checkIfActive: (view) ->
      if view && view.length > 0 && this.currentView && view == this.currentView then return 'active' else return null

  }

################################################################
################# Initialize ###################################

  init()

################################################################
################# Dashboard State ##############################

  if currentState() == 'dashboard'
    $scope.requestControl.getPodcasts()
    $scope.requestControl.getPosts()
]

