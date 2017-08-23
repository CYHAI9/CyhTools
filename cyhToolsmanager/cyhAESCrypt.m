//
//  cyhAESCrypt.m
//  CyhTools
//
//  Created by 陈海哥 on 2017/8/21.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "cyhAESCrypt.h"

@implementation cyhAESCrypt

+ (NSString *)encrypt:(NSString *)message password:(NSString *)password {
    NSData *encryptedData = [[message dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptedDataUsingKey:[[password dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
    NSString *base64EncodedString = [NSString base64StringFromData:encryptedData length:[encryptedData length]];
    return base64EncodedString;
}

+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password {
    NSData *encryptedData = [NSData base64DataFromString:base64EncodedString];
    NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:[[password dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
    return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}


+(NSString*) decryptText:(NSData*)data key:(NSString *)key{
    CCCryptorStatus status = kCCSuccess;
    NSData* result = [data decryptedDataUsingAlgorithm:kCCAlgorithmAES128
                                                   key:key initializationVector:nil   // ECB解密不会用到iv
                                               options:(kCCOptionPKCS7Padding|kCCOptionECBMode)
                                                 error:&status];
    if (status != kCCSuccess) {
        NSLog(@"解密失败:%d", status);
        return nil;
    }
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}


//============新添加
+(NSData *) encryptText:(NSString*)text key:(NSString *)key{
    CCCryptorStatus status = kCCSuccess;
    NSData* result = [[text dataUsingEncoding:NSUTF8StringEncoding]
                      dataEncryptedUsingAlgorithm:kCCAlgorithmAES128
                      key:key
                      initializationVector:nil   // ECB加密不会用到iv
                      options:(kCCOptionPKCS7Padding|kCCOptionECBMode)
                      error:&status];
    if (status != kCCSuccess) {
        NSLog(@"加密失败:%d", status);
        return nil;
    }
    return result;
}


@end
