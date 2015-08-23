ThePshqEntrepreneur.controller 'PostsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'PostsService', ($scope, $http, $location, $state, $stateParams, ngAudio, PostsService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    posts: []

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

]