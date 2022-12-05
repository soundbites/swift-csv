//
// Created by Robert van Loghem on 04/12/2022.
//

import Foundation

public class Reader {

    public enum ReaderError: Error {
        case unableToParseFile
    }

    private let url: URL
    private let delimiter: Character

    public init(url: URL, delimiter: Character) {
        self.url = url
        self.delimiter = delimiter
    }

    public func read() throws -> CSV {
        let contents = try String(contentsOf: url, encoding: .utf8)
        guard let csv = CSV(string: contents, delimiter: delimiter) else {
            throw ReaderError.unableToParseFile
        }
        return csv
    }
}

extension Reader.ReaderError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case.unableToParseFile:
            return "Unable to parse file..."
        }
    }
}