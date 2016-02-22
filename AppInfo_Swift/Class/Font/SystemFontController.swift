//
//  SystemFontController.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/2/22.
//  Copyright © 2016年 Sariel. All rights reserved.
//

import UIKit

class SystemFontController: UITableViewController {
    var arrData : NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 右滑返回
        let swipe = UISwipeGestureRecognizer(target: self, action: "viewBack")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipe);
        
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        self.getFons()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let dicFamilys = arrData[indexPath.section] as! NSDictionary
        let familyArr = dicFamilys["fonts"] as! NSArray
        let font = familyArr[indexPath.row] as! String
        
        // 当前字体
        var preferences = EasyTipView.globalPreferences
        preferences.drawing.font = UIFont(name: font, size: 14)!
        preferences.drawing.backgroundColor = UIColor.blackColor()
        EasyTipView.show(animated: true, forView: tableView.cellForRowAtIndexPath(indexPath)!, withinSuperview: self.view, text: "港版的全是三角充电器，你可以去手机店或开关店应该有卖的，我这也有\n1234567890\nabcdefghijklmnopqrstuvwxyz\nABCDEFGHIJKLMNOPQRSTUVWXYZ", preferences: preferences, delegate: nil)
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell")
        
        let dicFamilys = arrData[indexPath.section] as! NSDictionary
        let familyArr = dicFamilys["fonts"] as! NSArray
        let font = familyArr[indexPath.row] as! String
        cell.textLabel?.text = font
        
        cell.textLabel?.font = UIFont.init(name: font, size: 14)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dicFamilys = arrData[section] as! NSDictionary
        return ((dicFamilys["fonts"])?.count)!
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arrData.count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dicFontFamily : NSDictionary = arrData[section] as! NSDictionary
        
        let view = UILabel()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.9)
        view.frame = CGRectMake(0, 0, AppWindowWidth, 44)
        view.textColor = UIColor.whiteColor()
        view.text = " \(dicFontFamily["familyName"] as! String)"
        return view
    }
    
    /**
    *   获取字体
    */
    func getFons() {
        let arrTemp :NSMutableArray = NSMutableArray()
        let familys = UIFont.familyNames();
        
        for family in familys {
            let fonts = UIFont.fontNamesForFamilyName(family)
            
            if fonts.count <= 0 {
                continue
            }
            
            arrTemp.addObject(["familyName":family,"fonts":fonts])
        }
        
        arrData.removeAllObjects();
        arrData.addObjectsFromArray(arrTemp.sort { (fontName1, fontName2) -> Bool in
            let name1 : String = fontName1["familyName"] as! String
            let name2 : String = fontName2["familyName"] as! String
            let returnValue : Bool = name1 < name2
            return (returnValue)
            })
        
        
        self.tableView.reloadData()
    }
    
    func viewBack() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("back")
        }
    }
}
