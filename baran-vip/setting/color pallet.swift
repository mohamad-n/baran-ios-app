//
//  color pallet.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//


import Foundation
import UIKit

extension UIColor {
    
    static var main_white: UIColor  { return UIColor(hex: 0xF1F4F7) }

    
    //    static var Aquamarine: UIColor  { return UIColor(hex: 0x00DAC8) }
    //    static var Bluish: UIColor  { return UIColor(hex: 0x0982C2) }
    //    static var Fadedblue: UIColor  { return UIColor(hex: 0x8074BA) }
    
    
    static var Aquamarine: UIColor  { return UIColor(hex: 0x797CB7) }
    static var Bluish: UIColor  { return UIColor(hex: 0x3C84C0) }
    static var Fadedblue: UIColor  { return UIColor(hex: 0x65B5DE) }
    
    static var transWhie: UIColor  { return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7) }
    static var darkred: UIColor  { return UIColor(red: 0.824, green: 0.0, blue: 0.0, alpha: 1.0) }
    static var darkblue: UIColor  { return UIColor(red: 0.0, green: 0.282, blue: 0.573, alpha: 1.0) }
    static var lightgray: UIColor  { return UIColor(red: 0.949, green: 0.957, blue: 0.969, alpha: 1.0) }
    static var download_blue: UIColor  { return UIColor(hex: 0x0F79CA) }
    
    static var chat_blue: UIColor  { return UIColor(red: 0.235, green: 0.357, blue: 0.965, alpha: 1.0) }
    static var chat_gray: UIColor  { return UIColor(red: 0.816, green: 0.824, blue: 0.827, alpha: 1.0) }
    
    
    static var menuRed: UIColor  { return UIColor(hex: 0xE20000) }
    
    static var menuGray: UIColor  { return UIColor(hex: 0x939393) }
    
    static var addGreen: UIColor  { return UIColor(hex: 0x00AC3F) }
    static var warOrange: UIColor  { return UIColor(hex: 0xFEAA01) }
    static var midnight_blue: UIColor  { return UIColor(hex: 0x07003C) }
    static var Squash: UIColor  { return UIColor(hex: 0xf1a619) }
    
    
    static var themeColor: UIColor  { return UIColor(hex: 0x673ab7) }
    static var userProfileColor: UIColor  { return UIColor(hex: 0xf88e86) }
    static var profileSectionColor: UIColor  { return UIColor(hex: 0x9575cd) }
    static var rowTextColor: UIColor  { return UIColor(hex: 0x727272) }
    static var headerBarTitle: UIColor  { return UIColor(hex: 0x0099cc) }
    static var hyperLinkText: UIColor  { return UIColor(hex: 0x009688) }
    static var allPollText: UIColor  { return UIColor(hex: 0x757575) }
    static var pollBarEmpty: UIColor  { return UIColor(hex: 0xb2b2b2) }
    static var pollBarFull: UIColor  { return UIColor(hex: 0x5c8bbb) }
    static var boxBackground: UIColor  { return UIColor(hex: 0xf6f6f6) }
    static var boxBorder: UIColor  { return UIColor(hex: 0xdfdfdf) }
    static var userNameFont: UIColor  { return UIColor(hex: 0x0099cc) }
    static var Blue_Theme: UIColor  { return UIColor(hex: 0x3897F0) }
    
    
    //grays
    static var headerBar: UIColor  { return UIColor(hex: 0xf6f6f6) }
    static var lightGray: UIColor  { return UIColor(hex: 0xEBEBEB) }
    static var lightGray2: UIColor  { return UIColor(hex: 0xe0e0e0) }
    static var Dark_Theme: UIColor  { return UIColor(hex: 0x262424) }
    static var Gunmetal: UIColor  { return UIColor(hex: 0x5c5b5b) }
    static var Aluminium: UIColor  { return UIColor(hex: 0x989898) }
    
    static var transparent : UIColor {return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2)}
    
    
    
    
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}


extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        let red, green, blue, alpha: CGFloat
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            return nil
        }
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}
