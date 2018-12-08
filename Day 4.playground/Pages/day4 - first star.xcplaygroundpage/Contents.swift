import Foundation
import PlaygroundSupport

// Day 4 - first star

enum Event {
  case beginsShift
  case fallsAsleep
  case wakesUp
}

struct ScheduleItem {
  var year: Int = 0
  var month: Int = 0
  var day: Int = 0
  var hour: Int = 0
  var minute: Int = 0
  var guard_id: Int = 0
  var event: Event = .beginsShift
  
  func debugDescription() -> String {
    return "guard id: \(guard_id) --- \(year)-\(month)-\(day) \(hour):\(minute)"
  }
}

guard let fileUrl = Bundle.main.url(forResource: "day4_input", withExtension: "txt") else { fatalError("Can't find file") }
let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
let array = text.components(separatedBy: "\n")

let regex = try? NSRegularExpression(pattern: "\\[(\\d+)\\-(\\d+)\\-(\\d+)\\s(\\d+)\\:(\\d+)\\]\\s*(.+)", options: .caseInsensitive)

var convertedInput: [ScheduleItem] = []

var guard_id = "0"
var last_guard_id = "0"

for string in array {
  var year = ""
  var month = ""
  var day = ""
  var hour = ""
  var minute = ""
  var eventData = ""
  var eventType: Event = .beginsShift
  
  let matches = regex?.matches(in: string, options: .withTransparentBounds, range: NSRange(location: 0, length: string.count))
  if let match = matches?.first {
    if let yearRange = Range(match.range(at: 1), in: string) {
      year = String(string[yearRange])
    }
    if let monthRange = Range(match.range(at: 2), in: string) {
      month = String(string[monthRange])
    }
    if let dayRange = Range(match.range(at: 3), in: string) {
      day = String(string[dayRange])
    }
    if let hourRange = Range(match.range(at: 4), in: string) {
      hour = String(string[hourRange])
    }
    if let minuteRange = Range(match.range(at: 5), in: string) {
      minute = String(string[minuteRange])
    }
    if let eventDataRange = Range(match.range(at: 6), in: string) {
      eventData = String(string[eventDataRange])
      if(eventData.contains("Guard")) {
        var regex: NSRegularExpression?
        var matches: [NSTextCheckingResult]?
        regex = try? NSRegularExpression(pattern: "(\\d+)", options: .caseInsensitive)
        matches = regex?.matches(in: eventData, options: .withTransparentBounds, range: NSRange(location: 0, length: eventData.count))
        if let m = matches?.first {
          if let id_range = Range(m.range(at: 1), in: eventData) {
            guard_id = String(eventData[id_range])
            last_guard_id = guard_id
          }
        } else {
          guard_id = last_guard_id
        }
        regex = try? NSRegularExpression(pattern: "(begins)", options: .caseInsensitive)
        matches = regex?.matches(in: eventData, options: .withTransparentBounds, range: NSRange(location: 0, length: eventData.count))
        if matches?.first != nil {
          eventType = .beginsShift
        }
        regex = try? NSRegularExpression(pattern: "(falls)", options: .caseInsensitive)
        matches = regex?.matches(in: eventData, options: .withTransparentBounds, range: NSRange(location: 0, length: eventData.count))
        if matches?.first != nil {
          eventType = .fallsAsleep
        }
        regex = try? NSRegularExpression(pattern: "(wakes)", options: .caseInsensitive)
        matches = regex?.matches(in: eventData, options: .withTransparentBounds, range: NSRange(location: 0, length: eventData.count))
        if matches?.first != nil {
          eventType = .wakesUp
        }
      }
    }
    convertedInput.append(ScheduleItem(year: Int(year)!, month: Int(month)!, day: Int(day)!, hour: Int(hour)!, minute: Int(minute)!, guard_id: Int(guard_id)!, event: eventType))
  }
}

let sortedGuards = convertedInput.sorted { $0.guard_id <= $1.guard_id }
let sortedMonths = sortedGuards.sorted { $0.month <= $1.month }

for i in 0...15 {
  print("\n \(sortedMonths[i])")
}

var guard_ids: [Int] = []
for _guard in sortedGuards {
  if guard_ids.contains(_guard.guard_id) {
    continue
  } else {
    guard_ids.append(_guard.guard_id)
  }
}

var minutesSlept: [Int: Int] = [:]

for _guard_id in guard_ids {
  for _guard in sortedGuards.filter({ $0.guard_id == _guard_id }) {
    if _guard.event == .beginsShift {
    } else if _guard.event == .fallsAsleep {
      if(_guard.hour == 23) {
        minutesSlept.updateValue(minutesSlept[_guard.guard_id] ?? 0 + 60-_guard.minute, forKey: _guard.guard_id)
      } else {
        minutesSlept.updateValue(minutesSlept[_guard.guard_id] ?? 0 + _guard.minute, forKey: _guard.guard_id)
      }
    }
  }
}

sortedGuards.filter
