//
//  ViewController.m
//  CyhTools
//
//  Created by 陈海哥 on 2017/8/21.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "ViewController.h"
#import "cyhTools.h"
#import "ViewController02.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textTF;
@property (weak, nonatomic) IBOutlet UITextView *textVw;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
}

- (IBAction)keychain:(id)sender {

    [Cyhkeychain save_key:@"key" data_values:@"钥匙串信息，请打开capabilities中的钥匙串"];
    NSLog(@"钥匙串保存信息：%@",[Cyhkeychain load_key:@"key"]);
    //    [Cyhkeychain delete_key:@"key"];
    NSLog(@"手机标识信息：%@",[Cyhkeychain getUUID]);
}

- (IBAction)AesEn:(id)sender {
    
//    NSString * AESencrypt = [cyhAESCrypt encrypt:@"encryptString" password:@"123456"];
//    NSString * AESdecrypt = [cyhAESCrypt decrypt:AESencrypt password:@"123456"];
//    
//    NSLog(@"Aes加密字符串：%@==Aes解密字符串：%@",AESencrypt,AESdecrypt);
    
}

- (IBAction)ECBen:(id)sender {
    
//    NSData * ECBencrypt = [cyhAESCrypt encryptText:@"encryptString" key:@"123456"];
//    NSString * ECBdecrypt = [cyhAESCrypt decryptText:ECBencrypt key:@"123456"];
//    NSString * ecbEnstring = [NSString stringByEncodingData:ECBencrypt];
//    NSLog(@"ECB加密字符串：%@==ECB解密字符串：%@",ecbEnstring,ECBdecrypt);
}

- (IBAction)MD5_SHA:(id)sender {
    
    NSString * md5string = [@"md5String" md5];
    NSString * shaString = [@"ShaString" SHA1];
    
    NSLog(@"MD5加密：%@==SHA加密：%@",md5string,shaString);
}

- (IBAction)DeviceMessage:(id)sender {
    
    NSLog(@"手机别名：%@\n手机系统版本：%@\n 地方型号（国际化区域名称）：%@\n设备名称：%@\n设备当前网络IP：%@\n",[Cyhkeychain userPhoneName],[Cyhkeychain phoneVersion],[Cyhkeychain localPhoneModel],[Cyhkeychain deviceName],[Cyhkeychain getIPAddress:YES]);
}

- (IBAction)APPMessage:(id)sender {
    
    NSLog(@"App当前名字：%@\nAPP当前版本号：%@\nAPP当前构建版本号：%@\n当前设备型号：%@\n",[Cyhkeychain appCurName],[Cyhkeychain appCurVersion],[Cyhkeychain appCurVersionNum],[Cyhkeychain iOSplatform]);
    
    [[Cyhkeychain getAllphoneNumList] enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"通讯录:%@==%@",[obj objectForKey:@"name"],[obj objectForKey:@"phonenum"]);
    }];
}

- (void)setUI
{
   self.textTF.placeholder = @"textfield";
    [self.textTF setKeyboardButton:^(UITools *Tool) {
        Tool.buttonTitle(@"完成");
        Tool.buttonTitlecolor([UIColor redColor]);
        Tool.buttonBGcolor([UIColor orangeColor]);
        Tool.buttonTitleFont(17);
    } Compel:^(BOOL finish) {
        NSLog(@"注销响应");
    }];
   
    
    [self.textVw setKeyboardButton:^(UITools *Tool) {
        Tool.buttonTitle(@"完成");
        Tool.buttonTitlecolor([UIColor whiteColor]);
        Tool.buttonBGcolor([UIColor orangeColor]);
        Tool.buttonTitleFont(17);
    } Compel:^(BOOL finish) {
        NSLog(@"注销textview响应");
        
    }];
 
    
    
}

@end
