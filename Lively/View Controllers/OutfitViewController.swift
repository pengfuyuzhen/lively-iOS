import UIKit

final class OutfitViewController: UIViewController {
    
    @IBOutlet private var topImageView: UIImageView!
    @IBOutlet private var bottomImageView: UIImageView!
    
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
    
    private func populate(withData data: [String: Any]) {
        guard let topImageName = data["top"] as? String,
            let bottomImageName = data["bottom"] as? String,
            let isRetailItem = data["is_retail_item"] as? Bool else
        {
            return
        }

        self.topImageView.image = UIImage(named: topImageName)
        self.bottomImageView.image = UIImage(named: bottomImageName)
        print(isRetailItem)        
    }
}

