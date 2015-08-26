ThePshqEntrepreneur.controller 'DashboardController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'DashboardService', '$timeout', ($scope, $http, $location, $state, $stateParams, ngAudio, DashboardService, $timeout) ->

  init = ->
    console.log("inside the init")

    setUpCarousel()
    
  currentState = ->
    $state.current.name

  setUpCarousel = ->
    # Carousel initialization
    # $('.jcarousel').jcarousel wrap: 'circular'

    # $('.jcarousel-control-prev').on('jcarouselcontrol:active', ->
    #   $(this).removeClass 'inactive'
    #   return
    # ).on('jcarouselcontrol:inactive', ->
    #   $(this).addClass 'inactive'
    #   return
    # ).jcarouselControl target: '-=1'

    # $('.jcarousel-control-next').on('jcarouselcontrol:active', ->
    #   $(this).removeClass 'inactive'
    #   return
    # ).on('jcarouselcontrol:inactive', ->
    #   $(this).addClass 'inactive'
    #   return
    # ).jcarouselControl target: '+=1'
    
    return null


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

        debugger;

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

