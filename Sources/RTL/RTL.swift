//
//  RTL.swift
//  
//
//  Created by Tao Hongyu on 2021/1/16.
//

import Foundation

#if canImport(UIKit)
import UIKit

/// RightToLeft layout
protocol RTL {
    
    /// UIUserInterfaceLayoutDirection in App
    var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection { get }
    
    /// UIUserInterfaceLayoutDirection is equal to rightToLeft.
    var layoutDirectionRTL: Bool { get }
}

extension RTL {
    var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        return UIApplication.shared.userInterfaceLayoutDirection
    }
    var layoutDirectionRTL: Bool {
        return userInterfaceLayoutDirection == .rightToLeft
    }
    
}

/// UIUserInterface object's right to left fliped.
protocol RTLUserInterface: RTL {
    associatedtype Object
    func rightToLeftFlip() -> Object
}


extension UIImageView: RTLUserInterface {
    func rightToLeftFlip() -> UIImageView {
        guard layoutDirectionRTL,
              let image: UIImage = self.image else {
            return self }
        let new = image.flip()
        self.image = new
        return self
    }
}

extension UIImage: RTLUserInterface {
    func rightToLeftFlip() -> UIImage {
        guard layoutDirectionRTL else {
            return self }
        let new = self.flip()
        return new
    }
    
    fileprivate func flip() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.scaleBy(x: -1, y: 1)
        ctx?.translateBy(x: -self.size .width, y: 0)
        self.draw(in: CGRect(origin: .zero, size: self.size))
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}

extension UIEdgeInsets: RTLUserInterface {
    
    func rightToLeftFlip() -> UIEdgeInsets {
        guard layoutDirectionRTL else { return self }
        
        return UIEdgeInsets(top: self.top, left: -self.left, bottom: self.bottom, right: -self.right)
    }
}

#endif
