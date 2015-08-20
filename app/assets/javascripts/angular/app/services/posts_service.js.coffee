ThePshqEntrepreneur.factory 'PostsService', ['$resource', '$http', '$q', ($resource, $http, $q) ->

  getPosts: $resource "/get_posts.json", {}, query: { method: 'GET', isArray: false }

]