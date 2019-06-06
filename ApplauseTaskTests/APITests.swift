import XCTest
import OHHTTPStubs
@testable import ApplauseTask

class APITests: XCTestCase {

    override func setUp() {
        super.setUp()
        stub(condition: isHost("api.github.com")) { _ in
            let stubPath = OHPathForFile("ReposStub.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type": "application/json"])
        }
    }

    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }

    func testAPIClient_shouldFetchProperData() {
        //Arrange

        let request = APIRequest.ApplauseRepos
        let apiClient = APIClient()
        let fetchExpectation = expectation(description: "calls the callback with a resource object")

        // Act

        apiClient.perform(request) {(result) in
            switch result {
            case .success(let response):
                let response = try? response.decode(to: [Repository].self)
                XCTAssertEqual(response?.body.count, 20)
            case .failure:
                XCTFail("Request should end with success")
            }

            fetchExpectation.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: .none)

    }
}
