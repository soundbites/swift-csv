//
// Created by Robert van Loghem on 05/12/2022.
//

import Foundation

public extension CSV {
    init?(string contents: String, delimiter: Character) {
        let lines: [String] = contents.split { $0 == "\n" || $0 == "\r\n" }.map(String.init)

        let header: Header
        let rows: [Row]

        switch lines.count {
        case 1:
            header = Header(items: lines[0].split(separator: delimiter).map(Header.Item.init))
            rows = []
        case _ where lines.count > 1:
            header = Header(items: lines[0].split(separator: delimiter).map(Header.Item.init))
            rows = lines.suffix(from: 1).map { line -> Row in
                Row(values: line.split(separator: delimiter).map(Row.Value.init))
            }
        case _:
            return nil
        }
        self.init(header: header, rows: rows, delimiter: delimiter)
    }
}