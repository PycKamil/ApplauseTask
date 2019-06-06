import XCTest
@testable import ApplauseTask

class APIClientMock: APIClient {
    var passedRequest: APIRequest?
    override func perform(_ request: APIRequest, _ completion: @escaping APIClient.APIClientCompletion) {
        passedRequest = request
    }
}

class MainViewControllerTests: XCTestCase {

    func testMainViewController_shouldFetchProperData() {
        // Arrange
        let mainViewController = MainViewController()
        let apiClientMock = APIClientMock()

        // Act
        mainViewController.fetchRepositories(apiClient: apiClientMock)

        // Assert
        XCTAssertEqual(apiClientMock.passedRequest?.path, "orgs/ApplauseOSS/repos")
    }
}
