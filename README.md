# CyhTools
keychain保存，APP与设备信息，图片缓存

pod 'CyhTools'

1.钥匙串
```
    [Cyhkeychain save_key:@"key" data_values:@"钥匙串信息，请打开capabilities中的钥匙串"];

    NSLog(@"钥匙串保存信息：%@",
    [Cyhkeychain load_key:@"key"]);
    //    [Cyhkeychain delete_key:@"key"];
    NSLog(@"手机标识信息：%@",
    [Cyhkeychain getUUID]);
 ````   
2.AES/ECB加密
```
     NSString * AESencrypt = [cyhAESCrypt encrypt:@"encryptString" password:@"123456"];
     NSString * AESdecrypt = [cyhAESCrypt decrypt:AESencrypt password:@"123456"];
     
    NSData * ECBencrypt = [cyhAESCrypt encryptText:@"encryptString" key:@"123456"];
    NSString * ECBdecrypt = [cyhAESCrypt decryptText:ECBencrypt key:@"123456"];
    NSString * ecbEnstring = [NSString stringByEncodingData:ECBencrypt];  
 ```   
 3.MD5/SHA加密
 ```
     NSString * md5string = [@"md5String" md5];
     NSString * shaString = [@"ShaString" SHA1];
```
4.设备信息
 ```
     NSLog(@"手机别名：%@\n手机系统版本：%@\n 地方型号（国际化区域名称）：%@\n设备名称：%@\n设备当前网络IP：%@\n",
     [Cyhkeychain userPhoneName],
     [Cyhkeychain phoneVersion],
     [Cyhkeychain localPhoneModel],
     [Cyhkeychain deviceName],
     [Cyhkeychain getIPAddress:YES]); 
 ```
5.app信息
 ```  
     NSLog(@"App当前名字：%@\nAPP当前版本号：%@\nAPP当前构建版本号：%@\n当前设备型号：%@\n",
     [Cyhkeychain appCurName],
     [Cyhkeychain appCurVersion],
     [Cyhkeychain appCurVersionNum],
     [Cyhkeychain iOSplatform]);
    
    [[Cyhkeychain getAllphoneNumList] enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"通讯录:%@==%@",[obj objectForKey:@"name"],[obj objectForKey:@"phonenum"]);
    }];
 ```
 6.textfield/textView键盘“完成”键
   ``` 
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
   
```
7.图片缓存
```
     [UIImage SaveImageWithHomeDirectory_image:[UIImage imageNamed:@"to3.jpg"] Name:@"save01" SaveImageType:ImageTyJPG CompelWithpath:^(NSString *savePath, NSString *imagename) {
        NSLog(@"保存路径：\n%@",savePath);
    }];
    _Himageview.image = [UIImage GetImageWith_ImageNameOrUrlstringsandox:@"save01" imageSourceType:ImageFromTypeLocation CompelWithImage:^(UIImage *_image) {
        
    }]
    
网络读取
   
    _NimageView.image = [UIImage GetImageWith_ImageNameOrUrlstringsandox:urlstring imageSourceType:ImageFromTypeNetwork CompelWithImage:^(UIImage *_image) {
        
    }];
 ```
 
   
   
    
