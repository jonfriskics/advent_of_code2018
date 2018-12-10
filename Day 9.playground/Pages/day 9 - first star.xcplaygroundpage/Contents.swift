import Foundation
import PlaygroundSupport

// Day 9 - first star

guard let fileUrl = Bundle.main.url(forResource: "day9_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
var characters = Array(text)
characters.removeLast()
