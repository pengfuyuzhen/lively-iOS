import Foundation
import UIKit

extension UIFont {

    /// Create Lively's brand font
    ///
    /// - Parameter size: Font size in CGFloat
    static func brandFont(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Pacifico-Regular", size: size) else {
            return UIFont.systemFont(ofSize:size)
        }

        return font
    }
}
