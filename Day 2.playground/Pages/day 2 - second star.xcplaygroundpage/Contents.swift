import Foundation
import PlaygroundSupport

// Day 2 - second star

guard let fileUrl = Bundle.main.url(forResource: "day2_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
let array = text.components(separatedBy: "\n")

var candidates: [String] = []

for i in 0...array.count-1 {
  for j in 0...array.count-1 {
    let hamming = zip(array[j],array[i]).filter{ $0 != $1 }.count
    if(hamming == 1) {
      candidates.append(array[i])
    }
  }
}

let same = zip(candidates[0],candidates[1]).filter{ $0 == $1 }
print(same.compactMap({ String($0.0) }).joined(separator: ""))
