# [itunes-lib](http://github.com/dustmason/itunes-lib)

_ = require('underscore')
fs = require('fs')
plist = require('plist')
moment = require('moment')

module.exports = ituneslib = (options={}) ->
  itunesLib = module.exports.instance = new ITunesLib options

class ITunesLib
  constructor: (filepath) ->
    @data = plist.parseFileSync(filepath)
    @tracks = @data["Tracks"]

  size: ->
    Object.keys(@tracks).length

  songs: ->
    _.map @tracks, (track)->
      {
        title: track["Name"]
        artist: track["Artist"]
        album: track["Album"]
        play_count: track["Play Count"]
        date_added: moment(track["Date Added"]).toDate()
        play_date: moment(track["Play Date UTC"]).toDate()
      }


