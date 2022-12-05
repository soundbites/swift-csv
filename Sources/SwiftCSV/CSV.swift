//
// Created by Robert van Loghem on 04/12/2022.
//

public struct CSV: Equatable {
    public let header: Header?
    public let rows: [Row]
    public let delimiter: Delimiter

    public struct Header: Equatable {
        public typealias Item = String
        public let items: [Item]
    }

    public struct Row: Equatable {
        public typealias Value = String
        public let values: [Value]
    }

    public typealias Delimiter = Character

}
