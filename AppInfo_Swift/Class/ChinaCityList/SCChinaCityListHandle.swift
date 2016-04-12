//
//  SCChinaCityListHandle.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/4/12.
//  Copyright © 2016年 Sariel. All rights reserved.
//

import UIKit
//import SCChinaCityListModel

class SCChinaCityListHandle: NSObject {
    func handleCityListToArray() -> Array<SCChinaCityListModel> {
        var path : String = NSBundle.mainBundle().pathForResource("list", ofType: "txt")!
        var str : String! = String.init(contentsOfURL: path, encoding: string)
        
    }
}
