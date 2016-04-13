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
            var arrP : Array = [["name": "value" as AnyObject]]
            var arrCity : Array = [["name": "value" as AnyObject]]
            var arrCounty : Array = [["name": "value" as AnyObject]]
            
            arrP.removeAll()
            arrCity.removeAll()
            arrCounty.removeAll()
            
            for dic : NSDictionary in arrOld {
                switch dic["level"]!.integerValue {
                case 1:
                    arrP.append(dic as! Dictionary<String, AnyObject>)
                    break
                    case 2:
                    arrCity.append(dic as! Dictionary<String, AnyObject>)
                    break
                    case 3:
                    arrCounty.append(dic as! Dictionary<String, AnyObject>)
                    break
                default:
                    break
                }
            }
            
            // 把县级放入到市级
            for var i = 0; i < arrCounty.count; i++ {
                let dic : Dictionary = arrCounty[i] as Dictionary
                
                for var j = 0; j < arrCity.count; j++ {
                    var dicTemp:Dictionary = arrCity[j] as Dictionary
                    if dicTemp["code"]?.integerValue == dic["parentCode"]?.integerValue  {
                        if ((dicTemp["childList"]) != nil) {
                            var arrTemp : Array = dicTemp["childList"] as! Array<Dictionary<String, AnyObject>>
                            arrTemp.append(dic)
                            dicTemp["childList"] = arrTemp
                        } else {
                            dicTemp["childList"] = dic
                        }
                        break
                    }
                    arrCity[j] = dicTemp 
                }
            }
            
            // 把市级放入到省级
            for var i = 0; i < arrCity.count; i++ {
                let dic : Dictionary = arrCity[i] as Dictionary
                
                for var j = 0; j < arrP.count; j++ {
                    var dicTemp:Dictionary = arrP[j] as Dictionary
                    if dicTemp["code"]?.integerValue == dic["parentCode"]?.integerValue  {
                        if (dicTemp["childList"] != nil) {
                            var arrTemp : Array = dicTemp["childList"] as! Array<Dictionary<String, AnyObject>>
                            arrTemp.append(dic)
                            dicTemp.updateValue(arrTemp, forKey: "childList")
                        } else {
                            dicTemp["childList"] = [dic]
                        }
                        break
                    }
                    arrP[j] = dicTemp
                }
            }
            
            // 把 array转成string 保存起来
            print(arrP)
            
            
        } catch {
            print(error)
        }
    
        return []
    }
    
    func getCityList() -> Array<SCChinaCityListModel> {
        var arrNew = Array<SCChinaCityListModel>()
        
        let path : String = NSBundle.mainBundle().pathForResource("cityList", ofType: "txt")!
        do {
            let str : String = try String.init(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            let arrOld : Array = self.objectFromJson(str) as! Array<NSDictionary>
            for i in 0 ... (arrOld.count - 1) {
                arrNew.append(SCChinaCityListModel.mj_objectWithKeyValues(arrOld[i]))
            }
        } catch {
            print(error)
        }
        
        return arrNew
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
