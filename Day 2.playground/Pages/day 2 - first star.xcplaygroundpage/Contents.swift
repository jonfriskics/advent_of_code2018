import Foundation
import PlaygroundSupport

// Day 2 - first star

guard let fileUrl = Bundle.main.url(forResource: "day2_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
let array = text.components(separatedBy: "\n")

var count_of_two = 0;
var count_of_three = 0;

for string in array {
  let dict = string.map { ($0, 1) }
  let counts = Dictionary(dict, uniquingKeysWith: + )
  
  if(counts.filter { $0.value == 2}.count > 0) {
    count_of_two += 1
  }
  if(counts.filter { $0.value == 3}.count > 0) {
    count_of_three += 1
  }
}

count_of_two * count_of_three
