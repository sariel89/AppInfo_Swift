//
//  ViewController.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/2/22.
//  Copyright © 2016年 Sariel. All rights reserved.
//  rootViewController

import UIKit
//import publicconten

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableType : UITableView = UITableView(frame: CGRectMake(0, 0, AppWindowWidth, AppWindowHeight), style: UITableViewStyle.Plain);
    var arrData = [["name":"Font", "value": "SystemFontController"],
                   ["name": "Device Info", "value": "SystemFontController"],
                   ["name": "App Info", "value": "SystemFontController"],
                   ["name": "China City List", "value":"SCChinaCityListController"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        tableType.delegate = self;
        tableType.dataSource = self;
        tableType.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableType)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 表格的代理和数据源
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print(arrData[indexPath.row])
        
//        let dic = arrData[indexPath.row]
//        let controller : Class
//        self.presentViewController(NSClassFromString(dic["value"]!)(), animated: true, completion: nil)
        
        switch indexPath.row {
        case 0 :
            // 字体
            self.presentViewController(SystemFontController(), animated: true, completion: nil)

            break
            
        case 1 :
            // 设备信息
            self.presentViewController(DeviceInfoController(), animated: true, completion: nil)
            break
            
        case 2 :
            // App 信息
            self.presentViewController(AppInfoController(), animated: true, completion: nil)
            break
        case 3:
            // 全国行政区信息
            self.presentViewController(SCChinaCityListController(), animated: true, completion: nil)
            break
        default :
            // 其它情况
            
            break
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell")
        cell.textLabel?.text = arrData[indexPath.row]["name"]
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
}

