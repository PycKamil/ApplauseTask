import XCTest
import FBSnapshotTestCase
@testable import ApplauseTask

struct RepositoryViewModellMock: RepositoryViewModel {
    var authorText: String
    var titleText: String
    var subtitleText: String
    var repoUrl: URL?
}

class GithubReposCollectionViewControllerTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func testGithubReposCollectionViewController() {
        // Arrange
        let githubReposCollectionViewController = R.storyboard.main.githubReposCollectionViewController()
        UIApplication.shared.keyWindow?.rootViewController = githubReposCollectionViewController

        // Act
        githubReposCollectionViewController?.viewModels = stubbedViewModels()

        // Assert
        FBSnapshotVerifyView(githubReposCollectionViewController!.view)
    }

    private func stubbedViewModels() -> [RepositoryViewModel] {
        return [
            RepositoryViewModellMock(authorText: "Author1",
                                     titleText: "Title1",
                                     subtitleText: "Subtitle1",
                                     repoUrl: nil),
            RepositoryViewModellMock(authorText: "Author2",
                                     titleText: "Title2",
                                     subtitleText: "Subtitle2",
                                     repoUrl: nil),
            RepositoryViewModellMock(authorText: "Author3",
                                     titleText: "Title3",
                                     subtitleText: "Subtitle3",
                                     repoUrl: nil)
        ]
    }

}
