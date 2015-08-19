ThePshqEntrepreneur.factory 'PodcastsService', ['$resource', '$http', '$q', ($resource, $http, $q) ->

  findPodcast: $resource "/find_podcast.json", {}, query: { method: 'GET', isArray: false }

  getPodcasts: $resource "/get_podcasts.json", {}, query: { method: 'GET', isArray: false }

]