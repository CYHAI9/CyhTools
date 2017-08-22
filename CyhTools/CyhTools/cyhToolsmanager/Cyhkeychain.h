//
//  Cyhkeychain.h
//  VPNconect
//
//  Created by Macx on 16/4/20.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
@interface Cyhkeychain : NSObject
/**
 *  保存键值至钥匙串
 */
+ (void)save_key:(NSString *)service data_values:(id)data;
/**
 *  查询钥匙串

 */
+ (id)load_key:(NSString *)service;
/**
 *  删除钥匙串
 *
 */
+ (void)delete_key:(NSString *)service;
/**
 *  获取UUID
  */
+ (NSString *)getUUID;

/**
 创建一个随机的id
  */
+ (NSString *)createID;

/**
 手机别名
 */
+ (NSString *)userPhoneName;

/**
 设备名称
 */
+ (NSString *)deviceName;

/**
 手机系统版本
 */
+ (NSString *)phoneVersion;

/**
 地方型号  （国际化区域名称）
 */
+ (NSString *)localPhoneModel;

/**
 应用名称

 */
+ (NSString *)appCurName;

/**
当前应用软件版本  比如：1.0.1

 */
+ (NSString *)appCurVersion;

/**
 当前应用构建版本号
 */
+ (NSString *)appCurVersionNum;

/**
 手机型号（如5s，6plus,iphone8未纳入）

 */
+ (NSString *)iOSplatform;

/**
 获取当前IP，如果YES则返回IPVC4否则IPVC6


 */
+ (NSString *)getIPAddress:(BOOL)preferIPv4;

/**
 通讯录名单名字=号码，需在info.plist添加权限Privacy - Contacts Usage Description（真机测试）
 */
+ (NSArray<NSDictionary *> *)getAllphoneNumList;


@end
