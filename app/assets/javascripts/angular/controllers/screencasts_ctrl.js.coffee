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
    $scope.load_video()

  # Set the selected screencast to the one which was clicked
  $scope.showScreencast = (screencast, row) ->
    $scope.selectedScreencast = screencast
    $scope.selectedRow = row
    $scope.comments = $scope.selectedScreencast.comments
    $scope.load_video()

  $scope.load_video = ->
    myVideo = document.getElementsByTagName('video')[0];
    myVideo.src = $scope.selectedScreencast.video_url
    myVideo.load()

  #Create comment 
  $scope.create_comment = ->
    p = Comment.create id: $scope.selectedScreencast.id,
          comment: $scope.comment,
          -> 
            $location.path('/')
          (error) ->
            console.log(error)
    $scope.comments.push(p)
  
]

