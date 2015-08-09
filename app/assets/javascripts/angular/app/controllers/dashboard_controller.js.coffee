ThePshqEntrepreneur.controller 'DashboardController', ['$scope', '$http', '$location', '$state', '$stateParams', '$sce', ($scope, $http, $location, $state, $stateParams, $sce) ->

  init = ->
    console.log("inside the init")
    
  currentState = ->
    $state.current.name

################################################################
################# Request Control ##############################

  $scope.requestControl = {

  }

################################################################
################# Initialize ###################################

  init()

################################################################
################# Dashboard State ##############################

  if currentState() == 'dashboard'
    $scope.greeting = $sce.trustAsHtml(getRecordingHTML(1, "http://player.cinchcast.com/?platformId=1&assetType=single&assetId=7825147"))
]