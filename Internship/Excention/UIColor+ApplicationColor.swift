//
//  UIColor+ApplicationColor.swift
//  Internship
//
//  Created by Гусейн Агаев on 05.01.2021.
//

import UIKit

extension UIColor {
    
    // MARK: - Initialization
    
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // MARK: - ApplicationColor
    
    struct ApplicationСolor {
        static var background: UIColor  { return UIColor(hex: 0xFFFFFF) }
        static var interfaceUnit: UIColor { return UIColor(hex: 0xF8F8F8) }
        
        static var tintClose: UIColor { return UIColor(hex: 0x000000) }
        static var checkMark: UIColor { return UIColor(hex: 0x4A8DFF) }
        static var textColor: UIColor { return UIColor(hex: 0x000000) }
        static var buttonText: UIColor { return UIColor(hex: 0xFFFFFF) }
        
        static var buttonBackground: UIColor { return UIColor(hex: 0x4AABFF) }
    }
}
