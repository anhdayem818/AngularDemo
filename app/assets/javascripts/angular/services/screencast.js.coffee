App.factory 'Screencast', ['$resource', ($resource) ->
  $resource '/api/screencasts/:id?desiredScreencast=:desiredScreencast&start=:start', id: '@id',
  	query: 
  		isArray : true
  		cache: false
]

App.factory 'Comment', ['$resource', ($resource) -> 
	$resource 'api/screencasts/:id/comments', id:'@id',
		create : method: 'POST'
]
