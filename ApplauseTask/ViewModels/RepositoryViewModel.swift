import Foundation

protocol RepositoryViewModel {
    var authorText: String { get }
    var titleText: String { get }
    var subtitleText: String { get }
    var repoUrl: URL? { get }
}

struct RepositoryViewModelProvider {
    let model: Repository
}

extension RepositoryViewModelProvider: RepositoryViewModel {
    var authorText: String {
        return model.owner.login
    }
    var titleText: String {
        return model.name
    }
    var subtitleText: String {
        return model.fullName
    }

    var repoUrl: URL? {
        return URL(string: "https://github.com/" + model.fullName)
    }
}
