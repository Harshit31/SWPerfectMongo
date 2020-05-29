import XCTest
@testable import PerfectMongoDB

final class PerfectMongoDBTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PerfectMongoDB().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
