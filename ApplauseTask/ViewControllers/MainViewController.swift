import UIKit

class MainViewController: UIViewController {

    var githubReposCollectionViewController: GithubReposCollectionViewController? {
        return children.compactMap({ $0 as? GithubReposCollectionViewController}).first
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRepositories()
    }

    func fetchRepositories(apiClient: APIClient = APIClient()) {
        apiClient.perform(APIRequest.ApplauseRepos) { [weak self](result) in
            switch result {
            case .success(let response):
                do {
                    let response = try response.decode(to: [Repository].self)
                    let events = response.body
                    let viewModels = events.map({ RepositoryViewModelProvider(model: $0) })
                    DispatchQueue.main.async {
                        self?.githubReposCollectionViewController?.viewModels = viewModels
                    }
                } catch {
                    DispatchQueue.main.async {
                        self?.showErrorBanner("Server Error", message: "Failed to decode response \(error).")
                    }
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.showErrorBanner("Network Error", message: "Connection error occured.")
                }
            }
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.githubReposCollectionViewController?.searchKeyWord = searchText
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension APIRequest {
    static var ApplauseRepos: APIRequest {
        return  APIRequest(method: .get, path: "orgs/ApplauseOSS/repos")
    }
}
