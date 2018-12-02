import Foundation
import PlaygroundSupport

// Day 2 - first star

guard let fileUrl = Bundle.main.url(forResource: "day2_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
let array = text.components(separatedBy: "\n").map { Int($0)! }

