import Foundation
import PlaygroundSupport

// Day 3 - second star

struct Claim {
  var _id: Int = 0
  var x: Int = 0
  var y: Int = 0
  var w: Int = 0
  var h: Int = 0
}

guard let fileUrl = Bundle.main.url(forResource: "day3_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
let array = text.components(separatedBy: "\n")

let regex = try? NSRegularExpression(pattern: "#(\\d+)\\s@\\s(\\d+),(\\d+):\\s(\\d+)x(\\d+)", options: .caseInsensitive)

var convertedInput: [Claim] = []

for string in array {
  var _id = ""
  var x = ""
  var y = ""
  var w = ""
  var h = ""
  
  let matches = regex?.matches(in: string, options: .withTransparentBounds, range: NSRange(location: 0, length: string.count))
  if let match = matches?.first {
    if let idRange = Range(match.range(at: 1), in: string) {
      _id = String(string[idRange])
    }
    if let xRange = Range(match.range(at: 2), in: string) {
      x = String(string[xRange])
    }
    if let yRange = Range(match.range(at: 3), in: string) {
      y = String(string[yRange])
    }
    if let wRange = Range(match.range(at: 4), in: string) {
      w = String(string[wRange])
    }
    if let hRange = Range(match.range(at: 5), in: string) {
      h = String(string[hRange])
    }
  }
  convertedInput.append(Claim(_id: Int(_id)!, x: Int(x)!, y: Int(y)!, w: Int(w)!, h: Int(h)!))
}

var allXs: [Int] = []
var allYs: [Int] = []
var allWidths: [Int] = []
var allHeights: [Int] = []
for input in convertedInput {
  allXs.append(input.x)
  allYs.append(input.y)
  allWidths.append(input.w)
  allHeights.append(input.h)
}

let maxX = allXs.max()!
let maxWidth = allWidths.max()!
let xBoundary = maxX + maxWidth

let maxY = allYs.max()!
let maxHeight = allHeights.max()!
let yBoundary = maxY + maxHeight

var quilt = Array(repeating: Array(repeating: 0, count: xBoundary), count: yBoundary)
var squareInches: Int = 0

for claim in convertedInput {
  for row in claim.y..<claim.y+claim.h {
    for column in claim.x..<claim.x+claim.w {
      quilt[row][column] += 1
    }
  }
}

for claim in convertedInput {
  var overlap = true
  for row in claim.y..<claim.y+claim.h {
    for column in claim.x..<claim.x+claim.w {
      if quilt[row][column] > 1 {
        overlap = false
      }
    }
  }
  if overlap {
    print(claim._id)
  }
}
