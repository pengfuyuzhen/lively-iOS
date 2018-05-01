import UIKit

final class ChooseFromClosetViewController: UIViewController {
    @IBOutlet private var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        self.titleLabel.text = dateFormatter.string(from: Date())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction private func showNextOutfit() {
        if let pageViewController = self.childViewControllers.first as? OutfitPageViewController {
            pageViewController.showNextOutfit()
        }
    }

    @IBAction private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
