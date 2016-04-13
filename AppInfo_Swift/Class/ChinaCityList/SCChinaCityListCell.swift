//
//  SCChinaCityListCell.swift
//  AppInfo_Swift
//
//  Created by Sariel on 16/4/13.
//  Copyright © 2016年 Sariel. All rights reserved.
//

import UIKit

enum SCChinaCityListCellStatus {
    case haveChild         // 有子项目  -- 显示提示图标
    case selected       // 选中状态 -- 显示选中颜色
    case open           // 打开状态 -- 显示打开icon
    case noChild        // 没有子项目 -- 无显示
}

class SCChinaCityListCell: UITableViewCell {
    
    var model : SCChinaCityListModel = SCChinaCityListModel()
    
//    var labTitle
    
    func createCellViewInfo() {
        // 显示 cityName
        var cityName : String = self.model.name
        
        self.textLabel!.textColor = UIColor.whiteColor()
        
        // 根据等级显示不同的背景色
        var color : UIColor = UIColor()
        switch self.model.level {
        case 1:
            color = Tools().createColorWithHexAndAlpha("ff9500", alpha: 0.8)
            break
        case 2:
            cityName = "  \(self.model.name)"
            color = Tools().createColorWithHexAndAlpha("ffb44a", alpha: 0.8)
            break
        case 3:
            cityName = "    \(self.model.name)"
            color = Tools().createColorWithHexAndAlpha("ffd191", alpha: 0.8)
            break
        default:
            break
        }
        self.textLabel!.text = cityName
        self.backgroundColor = color
        
        // 根据状态显示不同的icon
        if self.model.isSelected {
            self.changeCellStatus(SCChinaCityListCellStatus.selected)
        } else if self.model.isOpen {
            self.changeCellStatus(SCChinaCityListCellStatus.open)
        } else {
            
            if nil != self.model.childList && self.model.childList.count > 0 {
                self.changeCellStatus(SCChinaCityListCellStatus.haveChild)
            } else {
                self.changeCellStatus(SCChinaCityListCellStatus.noChild)
            }
        }
        
        
    }
    
    func changeCellStatus(status : SCChinaCityListCellStatus) {
        switch status {
        case SCChinaCityListCellStatus.haveChild:
            self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            break
        case SCChinaCityListCellStatus.selected:
            self.accessoryType = UITableViewCellAccessoryType.Checkmark
            break
        case SCChinaCityListCellStatus.open:
            self.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
            break
        default:
            self.accessoryType = UITableViewCellAccessoryType.None
            break
        }
        
    }
    
}
