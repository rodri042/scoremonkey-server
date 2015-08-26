_ = require("protolodash")

###
Provides helpers to work with musical figures.
###
module.exports = new # singleton

class MusicalFigureDictionary
  constructor: ->
    @noteTypes = ["whole", "half", "quarter", "eighth", "sixteenth"]
      .map (name, i) =>
        length = 1 / Math.pow(2, i)
        [
          { name: name, duration: length, dot: false }
          { name: name, duration: length + length / 2, dot: true }
        ]
      .flatten()

  ###
  Gets all the info of a note type, based on the *duration*.
  ###
  findByDuration: (duration) =>
    @noteTypes.find { duration }

  ###
  Gets the closest valid duration of a *duration*.
  ###
  findClosestDuration: (duration) =>
    (_.map @noteTypes, "duration").reduce (previous, current) =>
      isCloser = Math.abs(current - duration) < Math.abs(previous - duration)
      itFits = duration - current >= 0
      if isCloser and itFits then current else previous