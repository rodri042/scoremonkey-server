_ = require("protolodash")

###
Provides helpers to work with musical figures.
###
module.exports = new # singleton

class MusicalFigureDictionary
  constructor: ->
    @noteTypes = ["whole", "half", "quarter", "eighth", "16th"]
      .map (figureName, i) =>
        length = 1 / Math.pow(2, i)
        [
          { name: figureName, duration: length, dot: false }
          { name: figureName, duration: length + length / 2, dot: true }
        ]
      .flatten()

  ###
  Gets all the info of a note type, based on the *duration*.
  ###
  findByDuration: (duration) =>
    _.find @noteTypes, { duration }

  ###
  Gets the closest valid duration of a *duration*.
  ###
  findClosestDuration: (duration) =>
    compare = (previous, current) =>
      isCloserThanPrevious = Math.abs(current - duration) < Math.abs(previous - duration)

      itFits = duration >= current
      if isCloserThanPrevious and itFits then current else previous

    closest = (_.map @noteTypes, "duration").reduce compare, 0
    @_checkClosest closest

  ###
  Check if *duration* is a valid value.
  ###
  _checkClosest: (duration) =>
    throw "The closest duration can't be zero!" if duration is 0
    duration
