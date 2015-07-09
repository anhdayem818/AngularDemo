App.controller 'ScreencastsCtrl', ['$scope', 'Screencast', 'Comment', '$location',($scope, Screencast, Comment, $location) ->
  # Attributes accessible on the view
  $scope.selectedScreencast = null
  $scope.selectedRow        = null
  $scope.comment = null

  # Gather the screencasts and set the selected one to the first on success
  $scope.screencasts = Screencast.query ->
    $scope.selectedScreencast = $scope.screencasts[0]
    $scope.selectedRow = 0
    $scope.comments = $scope.selectedScreencast.comments

  # Set the selected screencast to the one which was clicked
  $scope.showScreencast = (screencast, row) ->
    $scope.selectedScreencast = screencast
    $scope.selectedRow = row
    $scope.comments = $scope.selectedScreencast.comments

  #Create comment 
  $scope.create_comment = ->
    console.log($scope.comment)
    Comment.create id: $scope.selectedScreencast.id,
      comment: $scope.comment,
      -> 
        $location.path('/')
      (error) ->
        console.log(error)
    
]

