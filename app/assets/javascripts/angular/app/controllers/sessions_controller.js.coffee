ThePshqEntrepreneur.controller 'SessionsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'SessionsService', ($scope, $http, $location, $state, $stateParams, ngAudio, SessionsService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

    sign_out: ->
      SessionsService.signOut.query({}, (responseData) ->
        window.location = '/'
      )

    verifyEmail: (email) ->
      expression = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
      
      return expression.test(email)

  }

################################################################
################# Initialize ###################################

  init()

]