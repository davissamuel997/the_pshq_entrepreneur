ThePshqEntrepreneur.factory 'PostsService', ['$resource', '$http', '$q', ($resource, $http, $q) ->

  createComment: $resource "/create_post_comment.json", {}, query: { method: 'GET', isArray: false }

  createPost: $resource "/create_post.json", {}, query: { method: 'POST', isArray: false }

  findPost: $resource "/find_post.json", {}, query: { method: 'GET', isArray: false }

  getPosts: $resource "/get_posts.json", {}, query: { method: 'GET', isArray: false }

  updatePost: $resource "/update_post.json", {}, query: { method: 'POST', isArray: false }

]