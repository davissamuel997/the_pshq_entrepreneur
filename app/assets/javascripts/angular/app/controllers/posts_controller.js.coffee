ThePshqEntrepreneur.controller 'PostsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'PostsService', ($scope, $http, $location, $state, $stateParams, ngAudio, PostsService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    post: null

    posts: []

    findPost: ->
      if $state.params["post_id"] && parseInt($state.params["post_id"], 10) > 0
        PostsService.findPost.query({ post_id: $state.params["post_id"] }, (responseData) ->
          debugger
        )

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
################# New State ####################################

  if currentState() == 'new_post'
    console.log("in the new")

################################################################
################# Show State ###################################

  if currentState() == 'show_post'
    $scope.requestControl.findPost()

################################################################
################# Edit State ###################################

  if currentState() == 'edit_post'
    $scope.requestControl.findPost()

]