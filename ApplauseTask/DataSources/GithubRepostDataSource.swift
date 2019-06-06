import UIKit

class GithubRepostDataSource: NSObject {
    var searchKey: String?
    fileprivate var filteredItems: [RepositoryViewModel] {
        return Array(viewModels.filter ({ $0.contains(searchKey: searchKey) }).prefix(10))
    }
    fileprivate let viewModels: [RepositoryViewModel]

    init(viewModels: [RepositoryViewModel]) {
        self.viewModels = viewModels
    }

    func viewModel(at index: Int) -> RepositoryViewModel? {
        guard index < filteredItems.count else { return nil }
       return filteredItems[index]
    }
}

extension GithubRepostDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredItems.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.repoCollectionViewCell,
                                                      for: indexPath)!
        cell.configure(with: filteredItems[indexPath.row])
        return cell
    }
}

extension RepoCollectionViewCell {
    fileprivate func configure(with viewModel: RepositoryViewModel) {
        titleLabel.text = viewModel.titleText
        authorLabel.text = viewModel.authorText
        subtitleLabel.text = viewModel.subtitleText
    }
}

extension RepositoryViewModel {
    fileprivate func contains(searchKey: String?) -> Bool {
        guard let searchKey = searchKey, !searchKey.isEmpty else { return true }
        return titleText.localizedCaseInsensitiveContains(searchKey) ||
            authorText.localizedCaseInsensitiveContains(searchKey) ||
            subtitleText.localizedCaseInsensitiveContains(searchKey)
    }
}
