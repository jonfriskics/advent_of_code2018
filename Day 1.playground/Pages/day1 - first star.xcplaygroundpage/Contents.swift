import Foundation
import PlaygroundSupport

// Day 1 - first star

guard let fileUrl = Bundle.main.url(forResource: "day1_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
let array = text.components(separatedBy: "\n").map { Int($0)! }

var sum = 0

for number in array {
  sum += number
}

sum

