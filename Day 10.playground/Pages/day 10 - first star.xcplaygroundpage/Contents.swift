import Foundation
import PlaygroundSupport
import CoreGraphics

// Day 10 - first star

struct Point {
  var point: CGPoint
  var vel_x: Int = 0
  var vel_y: Int = 0
}

guard let fileUrl = Bundle.main.url(forResource: "day10_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
var array = text.components(separatedBy: "\n")
array.removeLast()

let regex = try? NSRegularExpression(pattern: "position\\=\\<\\s?([\\-\\d]+)\\,\\s*([\\-\\d]+)\\>\\s*velocity\\=\\<\\s?([\\-\\d]+)\\,\\s*([\\-\\d]+)\\>", options: .caseInsensitive)

var convertedInput: [Point] = []

for string in array {
  var pos_x = ""
  var pos_y = ""
  var vel_x = ""
  var vel_y = ""
  
  let matches = regex?.matches(in: string, options: .withTransparentBounds, range: NSRange(location: 0, length: string.count))
  if let match = matches?.first {
    if let pos_x_range = Range(match.range(at: 1), in: string) {
      pos_x = String(string[pos_x_range])
    }
    if let pos_y_range = Range(match.range(at: 2), in: string) {
      pos_y = String(string[pos_y_range])
    }
    if let vel_x_range = Range(match.range(at: 3), in: string) {
      vel_x = String(string[vel_x_range])
    }
    if let vel_y_range = Range(match.range(at: 4), in: string) {
      vel_y = String(string[vel_y_range])
    }
  }
  convertedInput.append(Point(point: CGPoint(x: Int(pos_x)!, y: Int(pos_y)!), vel_x: Int(vel_x)!, vel_y: Int(vel_y)!))
}
convertedInput = convertedInput.map { (input: Point) -> Point in
  var mutablePoint = input
  mutablePoint.point.x = ceil(mutablePoint.point.x / 1000)
  mutablePoint.point.y = ceil(mutablePoint.point.y / 1000)
  return mutablePoint
}

for point in convertedInput {
  print(point.point.x)
  print(point.point.y)
}
