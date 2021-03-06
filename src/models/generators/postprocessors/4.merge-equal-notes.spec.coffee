require("chai").Should()
execute = require("./4.merge-equal-notes")

describe "4.merge-equal-notes", ->
  it "can merge notes that must be merged", ->
    execute(tempo: 60, [
      { name: "g1", duration: 250, canBeMerged: true }
      { name: "e2", duration: 250, canBeMerged: false }
      { name: "e2", duration: 250, canBeMerged: true }
      { name: "f5", duration: 250, canBeMerged: true }
      { name: "f6", duration: 250, canBeMerged: true }
      { name: "f6", duration: 250, canBeMerged: true }
      { name: "f6", duration: 250, canBeMerged: true }
      { name: "r", duration: 250, canBeMerged: true }
      { name: "r", duration: 250, canBeMerged: true }
      { name: "c7", duration: 250, canBeMerged: true }
      { name: "c7", duration: 250, canBeMerged: true }
    ]).should.eql [
      { name: "g1", duration: 250 }
      { name: "e2", duration: 500 }
      { name: "f5", duration: 250 }
      { name: "f6", duration: 750 }
      { name: "r", duration: 500 }
      { name: "c7", duration: 500 }
    ]
