import UIKit

final class OutfitPageViewController: UIPageViewController {
    
    // TODO: - Stubbing outfit data, replace this later
    fileprivate let outfits = [
        ["rank": 1, "top": "Outfit - 1 - top", "bottom": "Outfit - 1 - bottom", "is_retail_item": false],
        ["rank": 2, "top": "Outfit - 2 - top", "bottom": "Outfit - 2 - bottom", "is_retail_item": false],
        ["rank": 3, "top": "Outfit - 3 - top", "bottom": "Outfit - 3 - bottom", "is_retail_item": false],
        ["rank": 4, "top": "Outfit - 4 - top", "bottom": "Outfit - 4 - bottom", "is_retail_item": true],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        let firstViewController = self.getOutfitViewController(withData: self.outfits[0])
        self.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
    }
    
    fileprivate func getOutfitViewController(withData data: [String: Any]) -> OutfitViewController {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "outfit")
            as! OutfitViewController
        viewController.outfitData = data
        return viewController
    }
}

// MARK: - UIPageViewControllerDataSource
extension OutfitPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let outfitViewController = viewController as? OutfitViewController,
            let outfitRank = outfitViewController.outfitData["rank"] as? Int else
        {
            return nil
        }
    
        if outfitRank == 1 {
            return nil
        }
        
        return self.getOutfitViewController(withData: self.outfits[outfitRank - 2])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let outfitViewController = viewController as? OutfitViewController,
            let outfitRank = outfitViewController.outfitData["rank"] as? Int else
        {
            return nil
        }
        
        if outfitRank == self.outfits.count {
            return nil
        }
        
        return self.getOutfitViewController(withData: self.outfits[outfitRank])
    }
}
