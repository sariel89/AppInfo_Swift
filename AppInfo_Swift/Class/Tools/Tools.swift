//
//  Tools.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/4/13.
//  Copyright © 2016年 Sariel. All rights reserved.
//

//import Cocoa
import UIKit

class Tools: NSObject {
    func createColorWithHex(hex : String) -> UIColor {
        return self.createColorWithHexAndAlpha(hex, alpha: 1.0)
    }
    
    func createColorWithHexAndAlpha(hex: String, alpha: CGFloat) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    // Json to Object
    
    // Object to Json
    
}
