require("chai").Should()
execute = require("./2.detect-notes")

describe "2.detect-notes", ->
  it "can detect the predominant note of a sample", ->
    execute([
      [
        { frequency: 83, duration: 80 }   # e2 = 82.41
        { frequency: 81, duration: 80 }   # e2 = 82.41
        { frequency: 7040, duration: 80 } # a8 = 7040
        { frequency: 86, duration: 10 }   # f2 = 87.31
      ]
      [
        { frequency: 86, duration: 70 }  # f2 = 87.31
        { frequency: 520, duration: 80 } # c5 = 523.25
        { frequency: 530, duration: 80 } # c5 = 523.25
        { frequency: 526, duration: 20 } # c5 = 523.25
      ]
      [
        { frequency: 48, duration: 60 } # g1 = 49.00
      ]
    ], tempo: 60).should.eql [
      { name: "e2", duration: 250, canBeMerged: true }
      { name: "c5", duration: 250, canBeMerged: true }
      { name: "g1", duration: 60, canBeMerged: true }
    ]

  it "marks as unmergeables the samples with rests", ->
    execute([
      [
        { frequency: 48, duration: 250 } # g1 = 49.00
      ]
      [
        { frequency: 83, duration: 80 }   # e2 = 82.41
        { frequency: 81, duration: 80 }   # e2 = 82.41
        { frequency: 0, duration: 80 } # a8 = 7040
        { frequency: 86, duration: 10 }   # f2 = 87.31
      ]
    ], tempo: 60).should.eql [
      { name: "g1", duration: 250, canBeMerged: true }
      { name: "e2", duration: 250, canBeMerged: false }
    ]