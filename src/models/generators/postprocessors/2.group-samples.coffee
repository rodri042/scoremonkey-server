BeatConverter = include("models/converters/beatConverter")
groupNotes = include("models/converters/groupNotes")
_ = require("protolodash")

MINIMUM_NOTE_LENGTH = 1/16

###
Groups the samples by a minimum note length.
 Input: [{frequency, duration}, ...]
 Output: [[{frequency, duration}, ...], ...]
###
module.exports = (settings, samples) =>
  minimumMs = new BeatConverter(settings.tempo).toMs MINIMUM_NOTE_LENGTH
  groupNotes samples, minimumMs
