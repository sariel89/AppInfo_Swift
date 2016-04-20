//
//  PWDModel.h
//  PasswordManager
//
//  Created by Sariel on 16/4/16.
//  Copyright © 2016年 Sariel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PWDModel : NSObject
@property (nonatomic, copy) NSString *accountName;  // 账号
@property (nonatomic, copy) NSString *accountPWD;   // 密码
@property (nonatomic, copy) NSString *webSite;      // 站点
@property (nonatomic, copy) NSString *bindPhone;    // 绑定的手机
@property (nonatomic, copy) NSString *bindMail; // 绑定的邮箱
@property (nonatomic, copy) NSString *tips;     // 放入密码提示问题等信息，
@property (nonatomic, copy) NSString *mark;     // 其他备注信息

@end
