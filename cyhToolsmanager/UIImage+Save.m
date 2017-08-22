//
//  UIImage+Save.m
//  DIYFont
//
//  Created by nopwd on 2017/6/15.
//  Copyright © 2017年 cyhaie. All rights reserved.
//
#import <Foundation/Foundation.h>
#import<CommonCrypto/CommonDigest.h>
#import "UIImage+Save.h"

@implementation UIImage (Save)

static NSFileManager * _fileManager;
+ (NSFileManager *)shareFileManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _fileManager = [NSFileManager defaultManager];
    });
    return _fileManager;
}

+ (void)SaveImageWithHomeDirectory_image:(UIImage *)Saveimage Name:(NSString *)Imagename SaveImageType:(ImageType)saveType CompelWithpath:(void (^)(NSString *, NSString *))path_sandox
{
    UIImage *imagesave = Saveimage;
//    NSString * path = NSHomeDirectory();
    NSString * paths = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *createPath = [NSString stringWithFormat:@"%@/CachImage/",paths];

    NSFileManager *fileManager = [UIImage shareFileManager];
    // 判断文件夹是否存在，如果不存在，则创建
    if (![fileManager fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];

    } else {
//        NSLog(@"FileDir is exists.");
    }
    if (saveType == ImageTYpPNG) {
        //设置一个图片的存储路径
        NSString *imagePath = [createPath stringByAppendingString:[NSString stringWithFormat:@"%@.png",[self MD5Hash:Imagename]]];
        if ([fileManager fileExistsAtPath:imagePath]==NO) {
        
            //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
            [UIImagePNGRepresentation(imagesave) writeToFile:imagePath atomically:YES];
        }
        
        path_sandox(imagePath,Imagename);
    }
    else if (saveType == ImageTyJPG)
    {
        //设置一个图片的存储路径
        NSString *imagePath = [createPath stringByAppendingString:[NSString stringWithFormat:@"%@.jpg",[self MD5Hash: Imagename]]];
           if ([fileManager fileExistsAtPath:imagePath]==NO) {
        //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
        [UIImageJPEGRepresentation(imagesave, 0.5) writeToFile:imagePath atomically:YES];
           }
        path_sandox(imagePath,Imagename);
    }
}

+ (UIImage *)GetImageWith_ImageNameOrUrlstringsandox:(NSString *)Imagename_urlstring imageSourceType:(ImageFromType)sourcetype CompelWithImage:(void (^)(UIImage *))image_sandox
{
    // 读取沙盒路径图片
    //        NSString * path = NSHomeDirectory();
    NSString * paths = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *createPath = [NSString stringWithFormat:@"%@/CachImage/",paths];//[paths objectAtIndex:0]
    if (sourcetype == ImageFromTypeLocation) {
      
        NSString * sandoxPath=[NSString stringWithFormat:@"%@%@.png",createPath,[self MD5Hash:Imagename_urlstring]];
        NSFileManager * fileManager = [UIImage shareFileManager];
        //判断是否存在路径
        if ([fileManager fileExistsAtPath:sandoxPath]==NO) {
            sandoxPath = [NSString stringWithFormat:@"%@%@.jpg",createPath,[self MD5Hash:Imagename_urlstring]];
        }
        // 拿到沙盒路径图片
        if ([fileManager fileExistsAtPath:sandoxPath]==YES) {
            UIImage *imgFromName=[UIImage imageWithContentsOfFile:sandoxPath];
            image_sandox(imgFromName);
            return imgFromName;
        }
        return nil;
    }
    else
    {
        NSString * sandoxPath=[NSString stringWithFormat:@"%@%@.png",createPath,[self MD5Hash:Imagename_urlstring]];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        UIImage *imgFromName;
        //判断是否存在路径
        if ([fileManager fileExistsAtPath:sandoxPath]==NO) {
           
            NSURL * url = [NSURL URLWithString:Imagename_urlstring];
            NSData * imagedata = [NSData dataWithContentsOfURL:url];
            UIImage * image = [UIImage imageWithData:imagedata];

            [self SaveImageWithHomeDirectory_image:image Name:Imagename_urlstring SaveImageType:ImageTYpPNG CompelWithpath:^(NSString *savePath, NSString *imagename) {
                
            }];
//
            imgFromName = image;
            if (!imgFromName) {
                NSLog(@"不存在该图片");
            }
        }
        else
        {
            imgFromName = [UIImage imageWithContentsOfFile:sandoxPath];
        }
        // 拿到沙盒路径图片
        
        image_sandox(imgFromName);
        return imgFromName;
    }

}

+ (UIImage *)SetImageFromNetWork_UrlString:(NSString *)urlstring PlaceholderImage:(UIImage *)PlaceholderImage IsSave:(BOOL)save CompelWithPath:(void (^)(NSString *))path_sandox
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
    NSString * URLString = urlstring;
    NSURL * URL = [NSURL URLWithString:URLString];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block UIImage * returnImage;
    NSURLSessionTask * task = [session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            
            returnImage = [UIImage imageWithData:data];
            
            if (returnImage && save) {
                
                path_sandox([self saveSandox_image:returnImage Path:urlstring]);

            }
            else
            {
            
                returnImage = PlaceholderImage;
            }
        
            
        }
        dispatch_semaphore_signal(semaphore);
    }];
    
    
    [task resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    
    return returnImage;
}

+ (NSString *)saveSandox_image:(UIImage *)_image Path:(NSString *)SandoxPath
{
    UIImage *imagesave = _image;
//    NSString * path = NSHomeDirectory();
    NSString * paths = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *createPath = [NSString stringWithFormat:@"%@/CachImage/",paths];//[paths objectAtIndex:0]
    // 判断文件夹是否存在，如果不存在，则创建
    NSFileManager * fileManager = [UIImage shareFileManager];
    if (![fileManager fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        
    } else {
        //        NSLog(@"FileDir is exists.");
    }
    NSString * imagetype = [SandoxPath substringFromIndex:SandoxPath.length - 4];
    NSString *urlPath = [SandoxPath substringToIndex:SandoxPath.length - 4];
    NSString * imagePath = [createPath stringByAppendingString:[NSString stringWithFormat:@"%@",[self MD5Hash:urlPath]]];
    NSString *_imagePath = @"";
    if ([imagetype containsString:@"png"]||[imagetype containsString:@"PNG"]) {
        //设置一个图片的存储路径
       _imagePath = [_imagePath stringByAppendingString:[NSString stringWithFormat:@"%@.png",imagePath]];
        //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
        if ([fileManager fileExistsAtPath:_imagePath]==NO) {
            [UIImagePNGRepresentation(imagesave) writeToFile:_imagePath atomically:YES];
        }
        
    }
    else
    {
        //设置一个图片的存储路径
      _imagePath = [_imagePath stringByAppendingString:[NSString stringWithFormat:@"%@.jpg",imagePath]];
        //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
        if ([fileManager fileExistsAtPath:_imagePath]==NO) {
        [UIImageJPEGRepresentation(imagesave, 0.5) writeToFile:_imagePath atomically:YES];
        }
    }
   
    return _imagePath;
}


+ (NSString *)base64EncodedString:(NSString *)EncodedString;
{
    NSData *data = [EncodedString dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}



+ (NSString *)MD5Hash:(NSString *)Input
{
    if (!Input||Input.length==0) {
        
        return nil;
    }
    const char *original_str = [Input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

+ (int)isJPEGValid:(NSData *)jpeg
{
    if ([jpeg length] < 4) return 1;
    const unsigned char * bytes = (const unsigned char *)[jpeg bytes];
    if (bytes[0] != 0xFF || bytes[1] != 0xD8) return 2;
    if (bytes[[jpeg length] - 2] != 0xFF ||
        bytes[[jpeg length] - 1] != 0xD9) return 3;
    return 0;
}

@end
