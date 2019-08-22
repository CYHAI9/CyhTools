//
//  UIImage+Save.h
//  DIYFont
//
//  Created by nopwd on 2017/6/15.
//  Copyright © 2017年 cyhaie. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 图片存储类型

 - ImageTYpPNG: png类型
 - ImageTyJPG: jpg类型
 */
typedef NS_ENUM(NSUInteger , ImageType) {

    ImageTYpPNG,
    ImageTyJPG
};


/**
 图片来源

 - ImageFromTypeNetwork: 来源于网络
 - ImageFromTypeLocation: 来源于本地
 */
typedef NS_ENUM(NSUInteger , ImageFromType) {
   
    ImageFromTypeNetwork,
    ImageFromTypeLocation
};

@interface UIImage (Save)


/**
 保存图片到沙盒

 @param Saveimage 保存的图片
 @param Imagename 图片的名字
 @param saveType 保存的图片类型，jpg或png
 @param path_sandox 返回储存路径和图片名字
 
 */
+ (void)SaveImageWithHomeDirectory_image:(UIImage *)Saveimage Name:(NSString *)Imagename SaveImageType:(ImageType)saveType CompelWithpath:(void(^)(NSString * savePath , NSString * imagename))path_sandox;

/**
 获取本地图片
 @param image_sandox 图片
 */
+ (UIImage *)GetImageWith_ImageNameOrUrlstringsandox:(NSString *)Imagename_urlstring imageSourceType:(ImageFromType)sourcetype CompelWithImage:(void(^)(UIImage * _image))image_sandox;

/**
 加载网络图片，并保存到本地

 @param urlstring 图片链接
 @param PlaceholderImage 占位图
 @param path_sandox 存储路径
 @return 返回图片
 */
+ (UIImage *)SetImageFromNetWork_UrlString:(NSString *)urlstring PlaceholderImage:(UIImage *)PlaceholderImage IsSave:(BOOL)save CompelWithPath:(void(^)(NSString * savePath))path_sandox;


+ (int)isJPEGValid:(NSData *)jpeg;
+ (NSString *)MD5Hash:(NSString *)Input;

@end
