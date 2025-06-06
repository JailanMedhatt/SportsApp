import UIKit
import Reachability
extension UIViewController {
    

    func startObservingNetworkStatus() {
//        var networkMonitor = NetworkMonitor.init { [weak self] in
//            self?.presentNoConnectionAlert()
//        }
    }

//
//    @objc func networkStatusChanged(_ notification: Notification) {
//        guard let userInfo = notification.userInfo,
//              let isConnected = userInfo["isConnected"] as? Bool else { return }
//
//        if isConnected {
//            // Dismiss alert if any is shown
//            print("connected")
//        } else {
//            print("disconnected")
//            presentNoConnectionAlert()
//        }
//    }
    func presentNoConnectionAlert() {
        guard presentedViewController == nil else { return }

        let alert = UIAlertController(
            title: "No Internet Connection",
            message: "Please check your internet settings.",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
