makeAlbum = (songNumber) ->
  if songNumber > 0
    console.log "Song number #{songNumber} Created"
    songNumber--
    makeAlbum(songNumber)
  else
    console.log "We just made a hit record"

makeAlbum 10
