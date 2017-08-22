//
//  UITextField+CyhTools.h
//  CyhiOSTools
//
//  Created by 陈海哥 on 2017/5/26.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITools.h"
@interface UITextField (CyhTools)<UITextFieldDelegate>

@property (nonatomic , copy)void(^keydownBlock)(BOOL finish);
- (void)setKeyboardButton:(void (^)(UITools * Tool))Tools Compel:(void (^)(BOOL finish))finish;


@end
@interface UITextView (CyhTools)<UITextViewDelegate>

@property (nonatomic , copy)void(^keydownBlock)(BOOL finish);
- (void)setKeyboardButton:(void (^)(UITools * Tool))Tools Compel:(void (^)(BOOL finish))finish;

@end
