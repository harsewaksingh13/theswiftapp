//
//  Extension+UIColor.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 14/05/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexValue = hex
        if (hex.hasPrefix("#")) {
            hexValue.remove(at: hex.startIndex)
        }
        let scanner = Scanner(string: hexValue)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    convenience init(hexColor: Color){
        self.init(hex:hexColor.rawValue)
    }
    
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
}
