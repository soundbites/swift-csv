import XCTest
import class Foundation.Bundle
@testable import SwiftCSV

final class WriterTests: XCTestCase {

    func testWriteCSV() throws {

        let delimiter: Character = ";"
        let csv = CSV(
            header: .init(items: ["A", "Header"]),
            rows: [
                .init(values: ["101", "102"]),
                .init(values: ["123", "456"])
            ],
            delimiter: delimiter
        )

        XCTAssertEqual(csv.prettyPrint, "A;Header\n101;102\n123;456")

        let writer = Writer(csv: csv)
        let fileName = "csv-unit-test.csv"
        try writer.write(to: fileName)

        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName) else {
            XCTFail()
            return
        }

        let reader = Reader(url: url, delimiter: delimiter)

        XCTAssertEqual(csv, try reader.read())
    }
}
