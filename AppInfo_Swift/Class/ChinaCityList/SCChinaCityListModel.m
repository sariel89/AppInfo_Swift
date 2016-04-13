//
//  SCChinaCityListModel.m
//  AppInfo_Swift
//
//  Created by Sariel on 16/4/13.
//  Copyright © 2016年 Sariel. All rights reserved.
//

#import "SCChinaCityListModel.h"

@implementation SCChinaCityListModel
+(NSDictionary *)objectClassInArray{
    return @{@"childList":@"SCChinaDistrictModel"};
}
@end
