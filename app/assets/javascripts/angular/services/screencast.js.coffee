App.factory 'Screencast', ['$resource', ($resource) ->
  $resource '/api/screencasts/:id', id: '@id'
]

App.factory 'Comment', ['$resource', ($resource) -> 
	$resource 'api/screencasts/:id/comments', id:'@id',
		create : method: 'POST'
]