ThePshqEntrepreneur.factory 'UsersService', ['$resource', '$http', '$q', ($resource, $http, $q) ->

  getCurrentUser: $resource "/users/current_user.json", {}, query: { method: 'GET', isArray: false }

]