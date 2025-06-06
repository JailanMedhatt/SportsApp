import UIKit
import Reachability
extension UIViewController {
    
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
