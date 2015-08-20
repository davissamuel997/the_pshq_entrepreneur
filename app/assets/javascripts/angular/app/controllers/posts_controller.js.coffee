ThePshqEntrepreneur.controller 'PostsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'PostsService', ($scope, $http, $location, $state, $stateParams, ngAudio, PostsService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

  	getPosts: ->
  		PostsService.getPosts.query({}, (responseData) ->
  			debugger
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