ThePshqEntrepreneur.controller 'PostsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'PostsService', ($scope, $http, $location, $state, $stateParams, ngAudio, PostsService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    posts: []

    findPost: ->
      if $state.params["post_id"] && parseInt($state.params["post_id"], 10) > 0
        debugger

    getPosts: ->
      PostsService.getPosts.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.posts = responseData.posts
      )

  }

################################################################
################# Initialize ###################################

  init()

################################################################
################# Index State ##################################

  if currentState() == 'index_posts'
    $scope.requestControl.getPosts()

################################################################
################# Show State ###################################

  if currentState() == 'show_post'
    $scope.requestControl.findPost()

]