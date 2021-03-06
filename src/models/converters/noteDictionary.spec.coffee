require("chai").Should()
noteDictionary = require("./noteDictionary")

describe "noteDictionary", ->
  r = name: "r", frequency: 0
  a4 = name: "a4", frequency: 440

  it "should return all the note names in 10 octaves", ->
    names = noteDictionary.noteNames()

    names.take 5
      .should.eql ["c0", "c#0", "d0", "d#0", "e0"]

    names.takeRight 5
      .should.eql ["g#10", "a10", "a#10", "b10", "r"]

  it "should return the info of a note", ->
    noteDictionary.get "a4"
      .should.be.eql name: "a4", frequency: 440

  it "should return the position of a note", ->
    noteDictionary.positionOf "a4"
      .should.be.eql 57

  describe "whatIs", ->
    it "should recognize a note by approximating frequencies", ->
      noteDictionary.whatIs(10).should.be.eql r
      noteDictionary.whatIs(430).should.be.eql a4

    it "should return a rest if the frequency is out of bounds", ->
      noteDictionary.whatIs(-70).should.be.eql r
      noteDictionary.whatIs(99999).should.be.eql r
