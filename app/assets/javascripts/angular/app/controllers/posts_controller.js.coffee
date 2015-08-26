ThePshqEntrepreneur.controller 'PostsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'PostsService', ($scope, $http, $location, $state, $stateParams, ngAudio, PostsService) ->

  init = ->
    console.log("inside the Posts init")
    $scope.postDatepicker.toggleMin();
    
  currentState = ->
    $state.current.name

###########################################################
################# Datepickers #############################

  $scope.postDatepicker = {

    dateOptions: {
      formatYear: 'yy',
      startingDay: 1,
      showWeeks: false
    };

    format: 'dd-MMMM-yyyy';

    minDate: new Date()

    opened: false

    clear: ->
      $scope.requestControl.params.post_date = null
    
    # Disable weekend selection
    disabled: (date, mode) ->
      return ( mode == 'day' && ( date.getDay() == 0 || date.getDay() == 6 ) );

    open: ($event) ->
      $event.preventDefault();
      $event.stopPropagation();

      if $scope.requestControl.params.post_date == null
        this.today()

      $scope.postDatepicker.opened = true;

    today: ->
      $scope.requestControl.params.post_date = new Date();

    toggleMin: ->
      $scope.minDate = $scope.minDate ? null : new Date();

  }

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    currentUser: null

    newComment: null

    params: {

      description: null

      name: null

      post_date: null

      summary: null

    }

    # Includes comments and user
    post: null

    posts: []

    createPost: ->
      if this.params
        PostsService.createPost.query({ post_params: this.params }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.post = responseData.post

            $location.path '/posts/' + $scope.requestControl.post.post_id
        )

    findPost: ->
      if $state.params["post_id"] && parseInt($state.params["post_id"], 10) > 0
        PostsService.findPost.query({ post_id: $state.params["post_id"] }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.post = responseData.post
            $scope.requestControl.currentUser = responseData.current_user

            $scope.requestControl.params.post_id = responseData.post.post_id
            $scope.requestControl.params.description = responseData.post.description
            $scope.requestControl.params.name = responseData.post.name
            $scope.requestControl.params.post_date = responseData.post.post_date
            $scope.requestControl.params.summary = responseData.post.summary
        )

    getPosts: ->
      PostsService.getPosts.query({}, (responseData) ->
        if responseData.errors == false
          $scope.requestControl.posts = responseData.posts

          $scope.requestControl.currentUser = responseData.current_user
      )

    goToNew: ->
      if this.currentUser && this.currentUser.id > 0
        $location.path '/posts/new'
      else
        gritterAdd("You must be logged in to create a post.")

    postComment: ->
      if this.post.post_id && parseInt(this.post.post_id, 10) > 0 && this.newComment && this.newComment.length > 0 && this.currentUser
        PostsService.createComment.query({ post_id: this.post.post_id, comment_description: this.newComment }, (responseData) ->
          if responseData.errors == false
            $scope.requestControl.post.comments = responseData.comments
        )

    reInitializePost: ->
      this.params.description = null
      this.params.name = null
      this.params.post_date = null
      this.params.summary = null

      this.post = null

    updatePost: ->
      if this.params && this.post.post_id && parseInt(this.post.post_id, 10) > 0
        PostsService.updatePost.query({ post_params: this.params, post_id: this.post.post_id }, (responseData) ->
          if responseData.errors == false
            $location.path '/posts/' + $scope.requestControl.post.post_id
        )

  }

################################################################
################# Initialize ###################################

  init()

################################################################
################# Index State ##################################

  if currentState() == 'index_posts'
    $scope.requestControl.reInitializePost()

    $scope.requestControl.getPosts()

################################################################
################# New State ####################################

  if currentState() == 'new_post'
    $scope.requestControl.reInitializePost()

################################################################
################# Show State ###################################

  if currentState() == 'show_post'
    $scope.requestControl.findPost()

################################################################
################# Edit State ###################################

  if currentState() == 'edit_post'
    $scope.requestControl.findPost()

]