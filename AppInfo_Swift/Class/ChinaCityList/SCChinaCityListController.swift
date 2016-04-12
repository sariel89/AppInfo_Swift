//
//  SCChinaCityListController.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/4/12.
//  Copyright © 2016年 Sariel. All rights reserved.
//

import UIKit

class SCChinaCityListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let handle = SCChinaCityListHandle()
        handle.handleCityListToArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
