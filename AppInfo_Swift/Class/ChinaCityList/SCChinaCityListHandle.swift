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
        let path : String = NSBundle.mainBundle().pathForResource("list", ofType: "txt")!
        
        
        do {
            let str : String = try String.init(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            
            let arrOld : Array = self.objectFromJson(str) as! Array<NSDictionary>
            print("arrOld count")
            print(arrOld.count)
            
            // 开始处理数据，
            let arrP = []
            let arrCity = []
            let arrCounty = []
            
            for dic : NSDictionary in arrOld {
                switch dic["level"]!.integerValue {
                case 1:
                    arrP.arrayByAddingObject(dic)
                    break
                    case 2:
                    arrCity.arrayByAddingObject(dic)
                    break
                    case 3:
                    arrCounty.arrayByAddingObject(dic)
                    break
                default:
                    break
                }
            }
            
            // 把县级放入到市级
            for var i = 0; i < arrCounty.count; i++ {
                let dic : NSDictionary = arrCounty[i] as! NSDictionary
                
                for var j = 0; j < arrCity.count; j++ {
                    let dicTemp:NSDictionary = arrCity[j] as! NSDictionary
                    if dicTemp["code"]!.integerValue == dic["parentCode"]!.integerValue  {
                        if (dicTemp["childList"] != nil) {
                            dicTemp["childList"]?.arrayByAddingObject(dic)
                        } else {
                            dicTemp.setValue([dic], forKey: "childList")
                        }
                        arrCity.repla
                        break
                    }
                }
            }
            
            // 把市级放入到省级
            
            
            // 把 array转成string 保存起来
            
            
            
        } catch {
            print(error)
        }
    
        return []
    }
    
    func jsonString(obj:AnyObject) -> String {
        let write : SBJson4Writer = SBJson4Writer()
        return write.stringWithObject(obj)
    }
    
    func objectFromJson(str:String) -> AnyObject {
        let data : NSData = str.dataUsingEncoding(NSUTF8StringEncoding)!
        
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
        } catch {
            print(error)
        }
        return ""
    }
}
