//
// Created by Robert van Loghem on 05/12/2022.
//

import Foundation

public extension CSV {
    var prettyPrint: String {
        let separator = String(delimiter)
        let headerString = header.map { header -> String in
            header.items.joined(separator: separator)
        } ?? ""

        return rows.reduce(headerString) { accumulator, row in
            let rowString = row.values.joined(separator: separator)
            if accumulator.isEmpty {
                return rowString
            } else {
                return "\(accumulator)\n\(rowString)"
            }
        }
    }
}
