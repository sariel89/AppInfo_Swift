//
//  SCChinaCityListModel.h
//  AppInfo_Swift
//
//  Created by Sariel on 16/4/13.
//  Copyright © 2016年 Sariel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface SCChinaCityListModel : NSObject
@property (nonatomic, assign) NSUInteger code;          // 编码
@property (nonatomic, assign) NSUInteger parentCode;    //上一级城市编码 (省份为 0)
@property (nonatomic, assign) NSUInteger level;         // 等级   省 1， 市 2， 县 3
@property (nonatomic, copy) NSString *name;             // 名称
@property (nonatomic, copy) NSString *latitude;         // 纬度
@property (nonatomic, copy) NSString *longitude;        // 经度

@property (nonatomic, copy) NSMutableArray *childList;         // 下一级城市，默认为nil
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, assign) BOOL isOpen;
@end
