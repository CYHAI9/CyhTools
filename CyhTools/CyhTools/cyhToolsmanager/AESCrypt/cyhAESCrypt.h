//
//  cyhAESCrypt.h
//  CyhTools
//
//  Created by 陈海哥 on 2017/8/21.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+Base64.h"
#import "NSData+Base64.h"
#import "NSData+CommonCrypto.h"

@interface cyhAESCrypt : NSObject
/**
 AES加密（256+PKCS7=>base64）
 */
+ (NSString *)encrypt:(NSString *)message password:(NSString *)password;

/**
 AES解密（base64=>256+PKCS7）
 */
+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password;


/**
ECB解密（128+PKCS7）
 */
+(NSString*) decryptText:(NSData*)data key:(NSString *)key;

/**
 ECB加密（128+PKCS7）
 */
+(NSData *) encryptText:(NSString*)text key:(NSString *)key;

@end
