import Foundation
import PlaygroundSupport

// Day 1 - second star

guard let fileUrl = Bundle.main.url(forResource: "day1_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
let array = text.components(separatedBy: "\n").map { Int($0)! }

var duplicate_found = false

var sum = 0
var sum_history: Set<Int> = []

while duplicate_found == false {
  loop: for number in array {
    sum += number
    if(sum_history.contains(sum)) {
      duplicate_found = true
      print(sum)
      break loop
    }
    sum_history.insert(sum)
  }
}
