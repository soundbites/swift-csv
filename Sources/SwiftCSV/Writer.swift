//
// Created by Robert van Loghem on 04/12/2022.
//

import Foundation

public class Writer {

    public enum WriterError: Error {
        case unableToCreateFile
    }

    let csv: CSV

    public init(csv: CSV) {
        self.csv = csv
    }

    public func write(to file: String) throws {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(file) else {
            throw WriterError.unableToCreateFile
        }
        try csv.prettyPrint.write(to: url, atomically: true, encoding: .utf8)
    }
}

extension Writer.WriterError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToCreateFile:
            return "Unable to create file at location"
        }
    }
}
