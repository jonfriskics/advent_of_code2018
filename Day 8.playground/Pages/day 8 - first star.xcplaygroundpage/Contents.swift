import Foundation
import PlaygroundSupport

// Day 8 - first star

guard let fileUrl = Bundle.main.url(forResource: "day8_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
var characters = Array(text)
characters.removeLast()
