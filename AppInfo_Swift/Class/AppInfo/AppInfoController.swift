//
//  AppInfoController.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/2/23.
//  Copyright © 2016年 Sariel. All rights reserved.
//

import UIKit

class AppInfoController: UIViewController {

    var labShow : UITextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // 右滑返回
        let swipe = UISwipeGestureRecognizer(target: self, action: "viewBack")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipe);
        
        labShow.frame = CGRectMake(0, 0, AppWindowWidth, AppWindowHeight)
        labShow.textColor = UIColor.blackColor()
        self.view.addSubview(labShow)
        
        self.getAppInfo()
        
        
    }
    
    func getAppInfo() {
        let info : Dictionary = NSBundle.mainBundle().infoDictionary!
        
        let str : NSMutableString = NSMutableString()
        for (key,value) in info {
            str.appendString("\(key) : \(value)\n")
        }
        
        
        labShow.text = str as String
    }
    
    func viewBack() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("back")
        }
    }
}
