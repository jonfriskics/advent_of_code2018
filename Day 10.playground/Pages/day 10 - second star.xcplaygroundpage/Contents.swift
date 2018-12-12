import Foundation
import PlaygroundSupport

// Day 10 - first star

guard let fileUrl = Bundle.main.url(forResource: "day10_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
let array = text.components(separatedBy: "\n")
