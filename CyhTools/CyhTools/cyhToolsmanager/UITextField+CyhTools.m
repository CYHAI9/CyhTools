//
//  UITextField+CyhTools.m
//  CyhiOSTools
//
//  Created by 陈海哥 on 2017/5/26.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "UITextField+CyhTools.h"
#import <objc/runtime.h>

@implementation UITextField (CyhTools)
static const char * key = "keyboar";
@dynamic keydownBlock;
- (void (^)(BOOL))keydownBlock
{
   return objc_getAssociatedObject(self, key);
}
- (void)setKeydownBlock:(void (^)(BOOL))keydownBlock
{
    objc_setAssociatedObject(self, key, keydownBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setKeyboardButton:(void (^)(UITools *))Tools Compel:(void (^)(BOOL))finish
{
    UITools * tool = [[UITools alloc] init];
    Tools(tool);
    self.delegate = self;
    self.keydownBlock = finish;
    [self setuUpUI:tool];
    
}
- (void)setuUpUI:(UITools *)Tools
{
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,40)];
  
   // [self.keybutton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [bar setItems:@[space,Tools.keybutton]];
//    [UITools addlayout:Tools.keybutton];

    self.inputAccessoryView = bar;
    
    [Tools.button addTarget:self action:@selector(bacKKeyBBtnBlicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)bacKKeyBBtnBlicked:(UIButton *)btn
{
    self.keydownBlock?self.keydownBlock(YES):nil;
    [self resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self resignFirstResponder];
}

@end

@implementation UITextView (CyhTools)
@dynamic keydownBlock;
- (void (^)(BOOL))keydownBlock
{
    return objc_getAssociatedObject(self, key);
}
- (void)setKeydownBlock:(void (^)(BOOL))keydownBlock
{
    objc_setAssociatedObject(self, key, keydownBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setKeyboardButton:(void (^)(UITools *))Tools Compel:(void (^)(BOOL))finish
{
    UITools * tool = [[UITools alloc] init];
    Tools(tool);
    self.delegate = self;
    self.keydownBlock = finish;
    [self setuUpUI:tool];
    
}
- (void)setuUpUI:(UITools *)Tools
{
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width,40)];
//    Tools.keybutton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 5,50, 30);
    // [self.keybutton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    [bar setItems:@[space,Tools.keybutton]];

//    [UITools addlayout:Tools.keybutton];
    self.inputAccessoryView = bar;
    [Tools.button addTarget:self action:@selector(bacKKeyBBtnBlicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)bacKKeyBBtnBlicked:(UIButton *)btn
{
    self.keydownBlock?self.keydownBlock(YES):nil;
    [self resignFirstResponder];
}


@end
