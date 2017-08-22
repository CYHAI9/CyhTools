//
//  UITools.m
//  CyhiOSTools
//
//  Created by 陈海哥 on 2017/5/27.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

#import "UITools.h"
@implementation UITools

- (UIButton *)keybutton
{
    if (!_keybutton) {
        _keybutton = [[UIButton alloc] init];
//        _keybutton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 5,50, 30);
    }
    return _keybutton;
}

- (void (^)(NSString *))buttonTitle
{
    return ^(NSString * btntext){
        [self.keybutton setTitle:btntext forState:UIControlStateNormal];
    };
}

- (void (^)(CGFloat ))buttonTitleFont
{
    return ^(CGFloat font){
        
        self.keybutton.titleLabel.font = [UIFont systemFontOfSize:font];
    };
    
}

- (void (^)(UIColor *))buttonTitlecolor
{
    return ^(UIColor * color){
        [self.keybutton setTitleColor:color forState:UIControlStateNormal];
    };
}

- (void (^)(UIColor *))buttonBGcolor
{
    return ^(UIColor * color){
        self.keybutton.backgroundColor = color;
    };
}


+ (void)addlayout:(UIView *)trag
{
//    NSLayoutConstraint *leftLc = [NSLayoutConstraint constraintWithItem:trag attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:trag.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:90];
    trag.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *rightLc = [NSLayoutConstraint constraintWithItem:trag attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:trag.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    NSLayoutConstraint *topLc = [NSLayoutConstraint constraintWithItem:trag attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:trag.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:5];
    
    NSLayoutConstraint *bottomLc = [NSLayoutConstraint constraintWithItem:trag attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:trag.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant: -5];
    NSLayoutConstraint *widthLc = [NSLayoutConstraint constraintWithItem:trag attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:64];
    [trag addConstraint:widthLc];
    [trag.superview addConstraint:bottomLc];
    [trag.superview addConstraint:topLc];
    [trag.superview addConstraint:rightLc];
    [trag.superview layoutIfNeeded];

}


@end
