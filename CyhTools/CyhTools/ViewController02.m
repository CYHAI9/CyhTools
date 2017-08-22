//
//  ViewController02.m
//  CyhTools
//
//  Created by 陈海哥 on 2017/8/21.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "ViewController02.h"
#import "cyhTools.h"
@interface ViewController02 ()
@property (weak, nonatomic) IBOutlet UIImageView *Himageview;

@property (weak, nonatomic) IBOutlet UIImageView *NimageView;
@end

@implementation ViewController02
{
    NSString * urlstring;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIImage SaveImageWithHomeDirectory_image:[UIImage imageNamed:@"to3.jpg"] Name:@"save01" SaveImageType:ImageTyJPG CompelWithpath:^(NSString *savePath, NSString *imagename) {
        NSLog(@"保存路径：\n%@",savePath);
    }];
    
    
    urlstring = @"http://test.yofus.com/resource/design/zpq/zhaopiankuanghshibacun/zhaopiankuanghshibacun/zpkshibacun/demo/page01.jpg";
    
}

- (IBAction)showImage:(id)sender {
    
    _Himageview.image = [UIImage GetImageWith_ImageNameOrUrlstringsandox:@"save01" imageSourceType:ImageFromTypeLocation CompelWithImage:^(UIImage *_image) {
        
    }];
}

- (IBAction)showNImage:(id)sender {
    
    _NimageView.image = [UIImage GetImageWith_ImageNameOrUrlstringsandox:urlstring imageSourceType:ImageFromTypeNetwork CompelWithImage:^(UIImage *_image) {
        
    }];
}

@end
