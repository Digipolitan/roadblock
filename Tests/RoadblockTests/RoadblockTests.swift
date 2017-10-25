import XCTest
@testable import Roadblock

class RoadblockTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDescription() {
        let t = TemplateClass()
        XCTAssertEqual(t.description, "TemplateDescription")
    }
}
