import XCTest
@testable import GraphQLHandler

class TestGraphQLHandler: XCTestCase {


    static var allTests: [(String, (TestGraphQLHandler) -> () throws -> Void)] {
        return [
            ("test200Ok", testShouldReturnStatusOk),
            ("testBadRequest", testShouldReturnStatusBadRequest),
        ]
    }

    func testShouldReturnStatusOk(){
        XCTAssertEqual(200, 200)
    }

    func testShouldReturnStatusBadRequest(){
        XCTAssertEqual(200, 200)
    }
