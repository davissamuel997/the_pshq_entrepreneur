ThePshqEntrepreneur.controller 'SessionsController', ['$scope', '$http', '$location', '$state', '$stateParams', 'ngAudio', 'DashboardService', ($scope, $http, $location, $state, $stateParams, ngAudio, DashboardService) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Params Check Control #########################



################################################################
################# Request Control ##############################

  $scope.requestControl = {

    params: {

      email: null

      first_name: null

      last_name: null

      password: null

      password_confirmation: null

    }

    checkLoginParams: ->
    	if this.params.email && this.verifyEmail(this.params.email) && this.params.password && this.params.password.length > 0 then return '' else return 'disabled'

    checkPersonalParams: ->
      if this.params.first_name && this.params.first_name.length > 0 && this.params.last_name && this.params.last_name.length > 0 && this.params.email && this.params.email.length > 0 && this.params.password && this.params.password.length > 0 && this.params.password_confirmation && this.params.password_confirmation.length > 0 && this.params.password == this.params.password_confirmation then true else false

    emailCheck: ->
      if this.params.email && this.params.email.length > 0 && this.verifyEmail(this.params.email) then 'has-success' else 'has-error'

    firstNameCheck: ->
      if this.params.first_name && this.params.first_name.length > 0 then 'has-success' else 'has-error'

    lastNameCheck: ->
      if this.params.last_name && this.params.last_name.length > 0 then 'has-success' else 'has-error'

    login: ->
    	debugger

    passwordCheck: ->
      if this.params.password && this.params.password.length > 0 then 'has-success' else 'has-error'

    passwordConfirmationCheck: ->
      if this.params.password_confirmation && this.params.password_confirmation.length > 0 && this.params.password == this.params.password_confirmation then 'has-success' else 'has-error'

    verifyEmail: (email) ->
      expression = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
      
      return expression.test(email)

  }

################################################################
################# Initialize ###################################

  init()

]