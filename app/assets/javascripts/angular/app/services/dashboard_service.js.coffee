ThePshqEntrepreneur.factory 'DashboardService', ['$resource', '$http', '$q', ($resource, $http, $q) ->

  getPodcasts: $resource "/get_podcasts.json", {}, query: { method: 'GET', isArray: false }

  getPosts: $resource "/get_posts.json", {}, query: { method: 'GET', isArray: false }

]