ThePshqEntrepreneur.config(function($stateProvider, $urlRouterProvider, $locationProvider) {
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise(function($injector, $location) {
    gritterAdd("That route is not available at this time.");

    $location.path('/');
  });

  // Now set up the states
  $stateProvider
    // Root route
    .state('dashboard', {
    	url: '/',
		  templateUrl: "/assets/dashboard/dashboard.html.haml",
		  controller: 'DashboardController'
    });

  // Enable HTML5. Removes /# from url.
  $locationProvider.html5Mode(true);
})

.run(function($rootScope, $state) {

  // previous state handling
  $rootScope.previousState = {};
  $rootScope.$on('$stateChangeSuccess',  function(event, toState, toParams, fromState, fromParams) {
    // store previous state in $rootScope
    $rootScope.previousState.name = fromState.name;
    $rootScope.previousState.params = fromParams;
  });

});
