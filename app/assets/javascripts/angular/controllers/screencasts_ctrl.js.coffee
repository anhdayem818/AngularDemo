App.controller 'ScreencastsCtrl', ['$scope', 'Screencast', 'Comment', '$location',($scope, Screencast, Comment, $location) ->
  # Attributes accessible on the view
  $scope.screencasts = []
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

  #loadMore
  $scope.loadMore = (e)->
    $scope.count = $scope.screencasts.length
    Screencast.query(
      start: $scope.count
      desiredScreencast: 10,
      (data) ->
        if data.length > 0
          $scope.screencasts =  $scope.screencasts.concat(data)
    )
  #Create comment 
  $scope.create_comment = ->
    p = Comment.create id: $scope.selectedScreencast.id,
          comment: $scope.comment,
          (data) -> 
            if data.status == 'ok'
              $scope.comments.push(data.comment)
              $scope.comment.content = null
              $scope.submitted = false
          (error) ->
            console.log(error)
]

