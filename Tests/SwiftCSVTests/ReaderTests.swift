import XCTest
import class Foundation.Bundle
@testable import SwiftCSV

final class ReaderTests: XCTestCase {

    func testReadSimpleCSV() throws {
        guard let filePath = Bundle.module.path(forResource: "test-01", ofType: "csv") else {
            XCTFail()
            return
        }
        let reader = Reader(url: URL(fileURLWithPath: filePath), delimiter: ",")
        let csv = try reader.read()

        XCTAssertNotNil(csv.header)
        XCTAssertEqual(csv.header?.items.count, 4)
        XCTAssertEqual(csv.header?.items[3], "Header")

        XCTAssertEqual(csv.rows.count, 2)
        XCTAssertEqual(csv.rows[0].values.count, 4)
        XCTAssertEqual(csv.rows[1].values[3], "104")
    }

    func testReadSimpleWithOnlyHeaderCSV() throws {
        guard let filePath = Bundle.module.path(forResource: "test-02", ofType: "csv") else {
            XCTFail()
            return
        }
        let reader = Reader(url: URL(fileURLWithPath: filePath), delimiter: ",")
        let csv = try reader.read()

        XCTAssertNotNil(csv.header)
        XCTAssertEqual(csv.header?.items.count, 6)
        XCTAssertEqual(csv.header?.items[5], "Contents")

        XCTAssertEqual(csv.rows.count, 0)
    }

}
