import UIKit

final class OutfitViewController: UIViewController {
    
    @IBOutlet private var topImageView: UIImageView!
    @IBOutlet private var bottomImageView: UIImageView!
    @IBOutlet private var roundButton: UIButton!
    
    /// Data containing the outfit information
    var outfitData: [String: Any] = [:] {
        didSet {
            if self.isViewLoaded {
                self.populate(withData: self.outfitData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.populate(withData: self.outfitData)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.roundButton.isSelected = false
    }
    
    private func populate(withData data: [String: Any]) {
        guard let topImageName = data["top"] as? String,
            let bottomImageName = data["bottom"] as? String,
            let isRetailItem = data["is_retail_item"] as? Bool else
        {
            return
        }

        self.topImageView.image = UIImage(named: topImageName)
        self.bottomImageView.image = UIImage(named: bottomImageName)
        self.roundButton.isHidden = !isRetailItem
    }
    
    @IBAction private func showDetail() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "retailDetail")
            as? RetailDetailViewController else
        {
            return
        }
        
        viewController.willDismiss = { [weak self] in
            self?.roundButton.isSelected = false
        }
        
        self.roundButton.isSelected = !self.roundButton.isSelected
        self.present(viewController, animated: true, completion: nil)
    }
}

