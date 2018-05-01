import UIKit
import SafariServices

private let kRetailerURLString = "https://www.zara.com/us/en/faux-leather-jacket-with-shoulder-pads-p03046031.html?v1=5421556&v2=358002"

final class RetailDetailViewController: UIViewController {
    
    /// Closure called when view controller is about to be dismissed
    var willDismiss: (() -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func shopNow(_ sender: Any) {
        guard let URL = URL(string: kRetailerURLString) else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: URL)
        safariViewController.modalPresentationStyle = .popover
        self.present(safariViewController, animated: true, completion: nil)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.willDismiss?()
        self.dismiss(animated: true, completion: nil)
    }
}
