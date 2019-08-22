//
//  NSString+encryptBox.h
//  LoginTest
//
//  Created by Macx on 16/7/7.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (encryptBox)
- (NSString *) md5;
- (NSString *) SHA1;
- (NSString *) sha1_base64;
- (NSString *) md5_base64;
- (NSString *) base64;
+ (NSString *) stringByEncodingData:(NSData *)EncodingData;
@end
