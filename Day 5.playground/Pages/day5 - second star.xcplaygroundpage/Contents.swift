import Foundation
import PlaygroundSupport

// Day 5 - second star

guard let fileUrl = Bundle.main.url(forResource: "day5_input", withExtension: "txt") else { fatalError("Can't find file") }
var text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)

let letters: Set<Character> = ["A", "a"]
text.removeAll(where: { letters.contains($0) })

var characters = Array(text)
characters.count
characters.last
characters.removeLast()

func matchingLettersPair(char1: Character, char2: Character) -> Bool {
  let string1 = String(char1)
  let string2 = String(char2)
  if(string1 == string2.uppercased() || string1.uppercased() == string2) {
    return true
  }
  return false
}

func iterateArray(chars: [Character]) {
  var cs = chars
  loop: for i in 0..<chars.count {
    if(i == cs.count - 1) {
      print("in conditional cs: \(cs), i: \(i), cs_count: \(cs.count), cs_count_minus_one: \(cs.count-1)")
      fatalError()
    }
    if(matchingLettersPair(char1: cs[i], char2: cs[i+1])) {
      cs.removeSubrange(i...i+1)
      iterateArray(chars: cs)
      break loop
    }
  }
}

iterateArray(chars: characters)
