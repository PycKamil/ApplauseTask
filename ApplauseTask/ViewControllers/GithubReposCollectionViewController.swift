import UIKit
import SafariServices

class GithubReposCollectionViewController: UICollectionViewController {

    var searchKeyWord: String? {
        didSet {
            self.githubRepostDataSource?.searchKey = searchKeyWord
            collectionView.reloadData()
        }
    }

    var viewModels: [RepositoryViewModel] = [] {
        didSet {
            self.githubRepostDataSource = GithubRepostDataSource(viewModels: viewModels)
        }
    }

    var githubRepostDataSource: GithubRepostDataSource? {
        didSet {
            collectionView.dataSource = githubRepostDataSource
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(R.nib.repoCollectionViewCell)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: view.bounds.width * 0.8, height: 60)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let repoURL = githubRepostDataSource?.viewModel(at: indexPath.row)?.repoUrl else {  return }
        let svc = SFSafariViewController(url: repoURL)
        present(svc, animated: true, completion: nil)
    }
}
