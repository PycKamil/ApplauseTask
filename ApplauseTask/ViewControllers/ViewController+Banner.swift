import NotificationBannerSwift
import UIKit

extension MainViewController {
    func showErrorBanner(_ title: String, message: String) {
        let banner = NotificationBanner(title: title, subtitle: message, style: .danger)
        banner.show()
    }
}
