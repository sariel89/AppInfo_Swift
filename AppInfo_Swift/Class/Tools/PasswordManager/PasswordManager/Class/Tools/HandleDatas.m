//
//  HandleDatas.m
//  PasswordManager
//
//  Created by Sariel on 16/4/16.
//  Copyright © 2016年 Sariel. All rights reserved.
//

#import "HandleDatas.h"
#import "MJExtension.h"

@implementation HandleDatas
// 保存数据
+ (BOOL) saveInfo:(PWDModel *)model {
    if (model) {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:[HandleDatas getAllDatas]];
        [arr addObject:[model mj_JSONObject]];
        [[NSUserDefaults standardUserDefaults] setObject:arr forKey:@"pwdList"];
        return YES;
    }
    return NO;
}

// 获取数据
+ (NSArray *)getModelWithKey:(NSString *)key {
    NSArray * arr = [HandleDatas getAllDatas];
    
    return arr;
}

+ (NSArray *) getAllDatas {
    NSArray *arr = [[NSUserDefaults standardUserDefaults] objectForKey:@"pwdList"];
    if (arr) {
        NSMutableArray *arrResult = [[NSMutableArray alloc] init];
        for (int i = 0; i < arr.count; i ++) {
            [arrResult addObject:[PWDModel mj_objectWithKeyValues:arr[i]]];
        }
        return arrResult;
    } else {
        return @[];
    }
}

@end

