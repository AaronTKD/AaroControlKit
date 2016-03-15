//
//  AaroFrostedGlassView.m
//  CarInsurance
//
//  Created by Lucky on 16/3/12.
//  Copyright © 2016年 geely. All rights reserved.
//

#import "AaroFrostedGlassView.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kDeviceSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define k4sHeight 480
#define k5sHeight 568
#define k6sHeight 667
#define kPlusHeight 736
@implementation AaroFrostedGlassView
- (instancetype)init{
    if (self = [super init]) {
        [self createFrostedGlassImageView];
    }
    return self;
}
- (void)createFrostedGlassImageView{
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self addSubview:backgroundImageView];
    
    if (kDeviceSystemVersion >= 8.0) {
        
        if (kWidth>=k4sHeight && kWidth<k5sHeight) {
            backgroundImageView.image = [UIImage imageNamed:@"iphone4-4"];
        }else if (kWidth>=k5sHeight && kWidth<k6sHeight){
            backgroundImageView.image = [UIImage imageNamed:@"iphone5-4"];
        }else if (kWidth>=k6sHeight && kWidth<kPlusHeight){
            backgroundImageView.image = [UIImage imageNamed:@"iphone6-4"];
        }else{
            backgroundImageView.image = [UIImage imageNamed:@"iphone6plus-4"];
        }
        
        [self createBlurEffect];
 
    }else{
        if (kWidth>=k4sHeight && kWidth<k5sHeight) {
            backgroundImageView.image = [UIImage imageNamed:@"背景640_960"];
        }else if (kWidth>=k5sHeight && kWidth<k6sHeight){
            backgroundImageView.image = [UIImage imageNamed:@"背景640_1136"];
        }else if (kWidth>=k6sHeight && kWidth<kPlusHeight){
            backgroundImageView.image = [UIImage imageNamed:@"背景750_1334"];
        }else{
            backgroundImageView.image = [UIImage imageNamed:@"背景1242_2208"];
        }
        
    }

}
- (void)createBlurEffect{
    //毛玻璃
    UIBlurEffect *blurEffect=[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView=[[UIVisualEffectView alloc]initWithEffect:blurEffect];
    [visualEffectView setFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self addSubview:visualEffectView];
}
@end
