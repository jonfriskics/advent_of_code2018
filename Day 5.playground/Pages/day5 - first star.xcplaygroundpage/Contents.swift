import Foundation
import PlaygroundSupport

// Day 5 - first star

guard let fileUrl = Bundle.main.url(forResource: "day5_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
var characters = Array(text)
characters.removeLast()

func matchingLettersPair(char1: Character, char2: Character) -> Bool {
  let string1 = String(char1)
  let string2 = String(char2)
  if(string1 != string2) {
    if(string1 == string2.uppercased() || string1.uppercased() == string2) {
      return true
    }
  }
  return false
}

func iterateArray(chars: [Character]) {
  loop: for i in 0..<chars.count {
    var cs = chars
    var new_cs: [Character] = []
    if i >= cs.count-1 {
//      print("loop broken \(i) \(cs.count)")
      break loop
    }
    let one = cs[i]
    let two = cs[i+1]
    if(matchingLettersPair(char1: one, char2: two)) {
//      print(cs.count, cs, cs[i...i+1], i...i+1)
//      cs.removeSubrange(i...i+1)
      new_cs = Array(cs[0...i]) + Array(cs[i+2..<cs.count])
//      print(cs.count, cs)
//      print(i, cs.count, "---")
      iterateArray(chars: new_cs)
      break loop
    } else {
      cs.count
    }
  }
}

iterateArray(chars: characters)
