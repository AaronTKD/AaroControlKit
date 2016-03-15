//
//  AaroForgetPasswordButton.m
//  登录注册页面
//
//  Created by Lucky on 16/3/11.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import "AaroForgetPasswordButton.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

/**
 Button的尺寸大小
 
 - returns: float
 */
#define kForgetButtonWidth 0.213*([UIScreen mainScreen].bounds.size.width)+30
#define kForgetButtonHeight 0.024*([UIScreen mainScreen].bounds.size.height)

#define kForgetButtonTopGap 0.344*([UIScreen mainScreen].bounds.size.height)
#define kForgetButtonLeftGap 0.393*([UIScreen mainScreen].bounds.size.width)-15

/**
 Button的颜色
 
 - returns: UIColor
 */
/**
 *  Font
 *
 *  @return
 */


#define AaroForgetButtonTitleColor [UIColor colorWithRed:2.0/255.0 green:170.0/255.0 blue:238.0/255.0 alpha:1]

@implementation AaroForgetPasswordButton

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(kForgetButtonLeftGap, kForgetButtonTopGap, kForgetButtonWidth, kForgetButtonHeight);
        [self setTitle:@"忘记密码?" forState:UIControlStateNormal];
//#warning 屏幕适配
        if (kHeight < 667) {
            self.titleLabel.font = [UIFont systemFontOfSize:12];
        }else{
            self.titleLabel.font = [UIFont systemFontOfSize:16];
        }
        
        [self setTitleColor:AaroForgetButtonTitleColor forState:UIControlStateNormal];
        self.backgroundColor = [UIColor clearColor];
        self.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
@end
