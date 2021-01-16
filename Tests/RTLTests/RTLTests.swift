import XCTest
@testable import RTL

final class RTLTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let edge = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        XCTAssertEqual(edge.rightToLeftFlip(), edge)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
