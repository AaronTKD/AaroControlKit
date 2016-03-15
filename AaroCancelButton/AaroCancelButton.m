//
//  AaroCancelButton.m
//  登录注册页面
//
//  Created by Lucky on 16/3/11.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import "AaroCancelButton.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kCancelButtonWidth 0.08*([UIScreen mainScreen].bounds.size.width)
#define kCancelButtonHeight 0.08*([UIScreen mainScreen].bounds.size.width)
#define kCancelButtonTopGap 0.579*([UIScreen mainScreen].bounds.size.height)
#define kCancelButtonLeftGap 0.46*([UIScreen mainScreen].bounds.size.width)
//static const CGFloat angle = -M_PI_4;
@implementation AaroCancelButton

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(kCancelButtonLeftGap, kCancelButtonTopGap, kCancelButtonWidth, kCancelButtonHeight);
        
        if (kHeight <=480) {
            [self setImage:[UIImage imageNamed:@"aaro_close"] forState:UIControlStateNormal];
        }
        else if (kHeight > 667) {
            [self setImage:[UIImage imageNamed:@"aaro_close@3x"] forState:UIControlStateNormal];
        }else{
            [self setImage:[UIImage imageNamed:@"aaro_close@2x"] forState:UIControlStateNormal];
        }
        
        self.backgroundColor = [UIColor clearColor];
     
    }
    return self;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [UIView animateWithDuration:.3 animations:^{
//            self.transform = CGAffineTransformRotate(self.transform, angle);
//        } completion:^(BOOL finished) {
//            
//        }];
//    });
//    
//    
//    
//}
@end
