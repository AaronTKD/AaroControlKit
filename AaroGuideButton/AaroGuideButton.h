//
//  AaroGuideButton.h
//  登录注册页面
//
//  Created by Lucky on 16/3/11.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,AaroGuideButtonType) {
    AaroGuideButtonTypeLogin, //登陆按钮
    AaroGuideButtonTypeNextStep,  //下一步按钮
    AaroGuideButtonTypeFinishChanges,  //完成修改
    AaroGuideButtonTypeFinishRegister,  //完成注册
};


@interface AaroGuideButton : UIButton
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new  UNAVAILABLE_ATTRIBUTE;
+ (instancetype)buttonWithType:(UIButtonType)buttonType UNAVAILABLE_ATTRIBUTE;
+ (instancetype)buttonWithAaroGuideType:(AaroGuideButtonType)aaroGuideType;
@end
