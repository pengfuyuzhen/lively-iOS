import Foundation
import UIKit

extension UIView {
    
    /// Corner radius in CGFloat
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }

        set {
            self.layer.cornerRadius = newValue
        }
    }
}
