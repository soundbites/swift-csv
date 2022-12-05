//
// Created by Robert van Loghem on 04/12/2022.
//

enum Arguments: String {
    case string
    case output
    case url
    case delimiter

    static func options(from arguments: [String]) -> [Arguments: String] {
        stride(from: 1, through: arguments.count, by: 2)
            .reduce([:]) { accumulator, index -> [Arguments: String] in
                guard index + 1 < arguments.count,
                      arguments[index].starts(with: "-"),
                      let option = Arguments(rawValue: arguments[index].replacingOccurrences(of: "-", with: ""))
                else {
                    return accumulator
                }
                var accumulator = accumulator
                accumulator[option] = arguments[index + 1]
                return accumulator
            }
    }
}

extension Dictionary where Key == Arguments {
    var shouldRead: Bool {
        self[Arguments.url] != nil && self[Arguments.delimiter] != nil
    }
    var shouldWrite: Bool {
        self[Arguments.string] != nil && self[Arguments.output] != nil && self[Arguments.delimiter] != nil
    }
}
