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
    })

///////////////////////////////////////////////////////////////////
/////////////////////// Podcasts Routes ///////////////////////////

    .state('index_podcasts', {
      url: '/podcasts',
      templateUrl: '/assets/podcasts/index.html.haml',
      controller: 'PodcastsController'
    })

    .state('show_podcast', {
      url: '/podcasts/:podcast_id',
      templateUrl: '/assets/podcasts/show.html.haml',
      controller: 'PodcastsController'
    })

    .state('edit_podcast', {
      url: '/podcasts/:podcast_id/edit',
      templateUrl: '/assets/podcasts/edit.html.haml',
      controller: 'PodcastsController'
    })

///////////////////////////////////////////////////////////////////
/////////////////////// Posts Routes //////////////////////////////

    .state('index_posts', {
      url: '/posts',
      templateUrl: '/assets/posts/index.html.haml',
      controller: 'PostsController'
    })

    .state('new_post', {
      url: '/posts/new',
      templateUrl: '/assets/posts/new.html.haml',
      controller: 'PostsController'
    })

    .state('show_post', {
      url: '/posts/:post_id',
      templateUrl: '/assets/posts/show.html.haml',
      controller: 'PostsController'
    })

    .state('edit_post', {
      url: '/posts/:post_id/edit',
      templateUrl: '/assets/posts/edit.html.haml',
      controller: 'PostsController'
    })

///////////////////////////////////////////////////////////////////
/////////////////////// Session Routes ////////////////////////////

    .state('current_user', {
      url: '/current_user',
      templateUrl: '/assets/sessions/current_user.html.haml',
      controller: 'SessionsController'
    })

    .state('sign_in', {
      url: '/users/sign_in',
      controller: 'SessionsController'
    })

    .state('sign_out', {
      url: '/users/sign_out',
      templateUrl: '/assets/sessions/current_user.html.haml',
      controller: 'SessionsController'
    })

///////////////////////////////////////////////////////////////////
/////////////////////// Users Routes //////////////////////////////

    .state('meet_the_hosts', {
      url: '/meet_the_hosts',
      templateUrl: '/assets/users/meet_the_hosts.html.haml',
      controller: 'UsersController'
    })

    .state('contact_pshq', {
      url: '/contact_pshq',
      templateUrl: '/assets/users/contact_pshq.html.haml',
      controller: 'UsersController'
    })

    .state('about_pshq', {
      url: '/about_pshq',
      templateUrl: '/assets/users/about_pshq.html.haml',
      controller: 'UsersController'
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
