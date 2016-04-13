//
//  SCChinaCityListController.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/4/12.
//  Copyright © 2016年 Sariel. All rights reserved.
//

import UIKit

class SCChinaCityListController: UITableViewController{
    
    var arrDefault = Array<SCChinaCityListModel>()
    var arrDatas = Array<SCChinaCityListModel>()
    
//    let selectedCity : Dictionary = ["provinceIndex" : -1, "cityIndex" : -1, "countyIndex" : -1]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let handle = SCChinaCityListHandle()
        arrDefault = handle.getCityList()
        arrDatas = arrDefault
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(SCChinaCityListCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // tableviewDelegate, TableviewDatasource
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell : SCChinaCityListCell = tableView.cellForRowAtIndexPath(indexPath) as! SCChinaCityListCell
        
        if nil == cell.model.childList || cell.model.childList.count == 0 {
            // 没有下一级目录，可以选中和取消选中
            cell.model.isSelected = !cell.model.isSelected
            // 刷新单个数据
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        } else {
            // 有下一级目录，可以打开和关闭
            
            if cell.model.isOpen {
                cell.model.isOpen = false
                // 关闭 -- 移除相关信息
                for var i = arrDatas.count - 1; i > indexPath.row; i -= 1 {
                    if arrDatas[i].parentCode == cell.model.code {
                        // code 相同，移除
                        arrDatas.removeAtIndex(i)
                    }
                }
                
            } else {
                cell.model.isOpen = true
                // 打开 -- 添加相关信息
                for i in 0 ..< cell.model.childList.count {
                    arrDatas.insert(cell.model.childList[i] as! SCChinaCityListModel, atIndex: indexPath.row + 1 + i)
                }
                
            }
            
            // 刷新tableview
            tableView.reloadData()
        }
       
        
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return arrDatas.count
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let model : SCChinaCityListModel = arrDatas[section]
//        if model.childList == nil || model.childList.count == 0 {
//            return 0
//        } else {
//            return model.childList.count
//        }
        return arrDatas.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : SCChinaCityListCell = tableView.dequeueReusableCellWithIdentifier("cell") as! SCChinaCityListCell
        cell.model = arrDatas[indexPath.row]
        cell.createCellViewInfo()
        return cell
    }

}
