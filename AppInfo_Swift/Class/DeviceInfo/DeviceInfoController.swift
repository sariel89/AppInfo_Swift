//
//  DeviceInfoController.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/2/22.
//  Copyright © 2016年 Sariel. All rights reserved.
//

import UIKit

class DeviceInfoController: UITableViewController {
    var arrData : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 右滑返回
        let swipe = UISwipeGestureRecognizer(target: self, action: "viewBack")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipe);
        
        // 初始化数据源
        self.getDataSource()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let dic : NSDictionary = arrData[indexPath.row] as! NSDictionary
        let name : String = dic["key"] as! String
        let value : String = String(stringInterpolationSegment: dic["value"]!)
        
        var preferences = EasyTipView.globalPreferences
        preferences.drawing.backgroundColor = UIColor.blackColor()
        EasyTipView.show(animated: true, forView: tableView.cellForRowAtIndexPath(indexPath)!, withinSuperview: self.view, text: "\(name) \n \(value)", preferences: preferences, delegate: nil)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell");
            cell?.textLabel?.font = UIFont.systemFontOfSize(12)
        }
        
        let dic : NSDictionary = arrData[indexPath.row] as! NSDictionary
        let name : String = dic["key"] as! String
        let value : String = String(stringInterpolationSegment: dic["value"]!)
        cell!.textLabel?.text = name
        cell!.detailTextLabel?.text = value
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func getDataSource() {
        let deviceInfo = UIDevice.currentDevice()
        
        arrData.addObject(["key":"name", "value":deviceInfo.name])
        arrData.addObject(["key":"systemName", "value":deviceInfo.systemName])
        arrData.addObject(["key":"systemVersion", "value":deviceInfo.systemVersion])
        arrData.addObject(["key":"model", "value":deviceInfo.model])
        arrData.addObject(["key":"localizedModel", "value":deviceInfo.localizedModel])
        arrData.addObject(["key":"generatesDeviceOrientationNotifications", "value":(deviceInfo.generatesDeviceOrientationNotifications ? "True" : "False")])
        arrData.addObject(["key":"batteryMonitoringEnabled", "value":deviceInfo.batteryMonitoringEnabled ? "True" : "False"])
        arrData.addObject(["key":"batteryLevel", "value":String(stringInterpolationSegment: deviceInfo.batteryLevel)])
        arrData.addObject(["key":"proximityMonitoringEnabled", "value":deviceInfo.proximityMonitoringEnabled])
        arrData.addObject(["key":"proximityState", "value":deviceInfo.proximityState])
        arrData.addObject(["key":"multitaskingSupported", "value":deviceInfo.multitaskingSupported])
        arrData.addObject(["key":"identifierForVendor", "value":deviceInfo.identifierForVendor!.UUIDString])
        
        var faceIdionStr : String = "Unspecified"
        switch deviceInfo.userInterfaceIdiom {
        case UIUserInterfaceIdiom.Phone:
            faceIdionStr = "Phone"
            break
        case UIUserInterfaceIdiom.Pad:
            faceIdionStr = "Pad"
            break
        case UIUserInterfaceIdiom.TV:
            faceIdionStr = "TV"
            break
        default :
            faceIdionStr = "Unspecified"
            break
        }
        arrData.addObject(["key":"userInterfaceIdiom", "value":faceIdionStr])
        
        var orientationStr : String = "Unknown"
        switch deviceInfo.orientation {
        case UIDeviceOrientation.Portrait:
            orientationStr = "Portrait"
            break
        case UIDeviceOrientation.PortraitUpsideDown:
            orientationStr = "PortraitUpsideDown"
            break
        case UIDeviceOrientation.LandscapeLeft:
            orientationStr = "LandscapeLeft"
            break
        case UIDeviceOrientation.LandscapeRight:
            orientationStr = "LandscapeRight"
            break
        case UIDeviceOrientation.FaceUp:
            orientationStr = "FaceUp"
            break
        case UIDeviceOrientation.FaceDown:
            orientationStr = "FaceDown"
            break
        default :
            break
        }
        
        arrData.addObject(["key":"orientation", "value":orientationStr])
        
        var batteryState = "Unknown"
        switch deviceInfo.batteryState {
        case UIDeviceBatteryState.Unplugged:
            batteryState = "Unplugged"
            break
        case UIDeviceBatteryState.Charging:
            batteryState = "Charging"
            break
        case UIDeviceBatteryState.Full:
            batteryState = "Full"
            break
        default :
            break
        }
        arrData.addObject(["key":"batteryState", "value":batteryState])
        
        print(deviceInfo)
        // 重新刷新
        self.tableView.reloadData()
    }
    
    func viewBack() {
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("back")
        }
    }
}
