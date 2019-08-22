//
//  UITools.h
//  CyhiOSTools
//
//  Created by 陈海哥 on 2017/5/27.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UITools : NSObject

@property (nonatomic , strong)UIBarButtonItem * keybutton;
@property (nonatomic , strong)UIButton * button;

- (void(^)(NSString *))buttonTitle;
- (void(^)(UIColor *))buttonTitlecolor;
- (void(^)(UIColor *))buttonBGcolor;
- (void(^)(CGFloat ))buttonTitleFont;
+ (void)addlayout:(UIView *)trag;

@end
