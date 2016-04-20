//
//  HandleDatas.h
//  PasswordManager
//
//  Created by Sariel on 16/4/16.
//  Copyright © 2016年 Sariel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWDModel.h"

@interface HandleDatas : NSObject

// 保存数据
+ (BOOL) saveInfo:(PWDModel *)model;

// 获取数据
+ (NSArray *)getModelWithKey:(NSString *)key;

// 获取全部数据
+ (NSArray *)getAllDatas;
@end
