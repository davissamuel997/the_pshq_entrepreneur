ThePshqEntrepreneur.factory 'PodcastsService', ['$resource', '$http', '$q', ($resource, $http, $q) ->

  getPodcasts: $resource "/get_podcasts.json", {}, query: { method: 'GET', isArray: false }

]