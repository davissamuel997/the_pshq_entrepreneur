ThePshqEntrepreneur.factory 'PostsService', ['$resource', '$http', '$q', ($resource, $http, $q) ->

  findPost: $resource "/find_post.json", {}, query: { method: 'GET', isArray: false }

  getPosts: $resource "/get_posts.json", {}, query: { method: 'GET', isArray: false }

]