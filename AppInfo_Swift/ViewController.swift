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
    var arrData = ["Font", "Device Info", "App Info"]

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
        default :
            // 其它情况
            
            break
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell")
        cell.textLabel?.text = arrData[indexPath.row]
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

