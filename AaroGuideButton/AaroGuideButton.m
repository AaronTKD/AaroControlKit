//
//  AaroGuideButton.m
//  登录注册页面
//
//  Created by Lucky on 16/3/11.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import "AaroGuideButton.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

/**
 *  基本尺寸：宽、高、左侧距离

 *  @return float
 */
#define kButtonWidth 0.733*([UIScreen mainScreen].bounds.size.width)
#define kButtonHeight 0.066*([UIScreen mainScreen].bounds.size.height)
#define kButtonLeftGap 0.1335*([UIScreen mainScreen].bounds.size.width)
#define kButtonTopGap 0.4175*([UIScreen mainScreen].bounds.size.height)


/**
 *  登陆按钮
 */
#define LoginButtonName @"登 陆"


/**
 *  下一步按钮
 */
#define NextStepButtonName @"下一步"

/**
 *  完成修改按钮
 */
#define FinishChangesButtonName @"完成修改"
/**
 *  完成注册按钮
 */
#define FinishRegisterButtonName @"完成注册"

#define AaroButtonColor [UIColor colorWithRed:2.0/255.0 green:170.0/255.0 blue:238.0/255.0 alpha:1]

static const CGFloat AaroCornerRadius = 4.0;

@implementation AaroGuideButton
+ (instancetype)buttonWithAaroGuideType:(AaroGuideButtonType)aaroGuideType{

    AaroGuideButton *aaroButton = [[AaroGuideButton alloc] initWithFrame:CGRectMake(kButtonLeftGap, kButtonTopGap, kButtonWidth, kButtonHeight)];
    aaroButton.backgroundColor = AaroButtonColor;
    [aaroButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    #warning 屏幕适配
    if (kHeight < 568.0) {
        aaroButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];//黑粗体12
    }else{
        aaroButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];//黑粗体20
    }
    

    //设置圆角
    [aaroButton.layer setMasksToBounds:YES];
    [aaroButton.layer setCornerRadius:AaroCornerRadius];
    
    [aaroButton.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [aaroButton.layer setBorderWidth:.5];
    
    switch (aaroGuideType) {
        case AaroGuideButtonTypeLogin:
            [aaroButton setTitle:LoginButtonName forState:UIControlStateNormal];
            break;
        case AaroGuideButtonTypeNextStep:
            [aaroButton setTitle:NextStepButtonName forState:UIControlStateNormal];
            break;
        case AaroGuideButtonTypeFinishChanges:
            [aaroButton setTitle:FinishChangesButtonName forState:UIControlStateNormal];
            break;
        case AaroGuideButtonTypeFinishRegister:
            [aaroButton setTitle:FinishRegisterButtonName forState:UIControlStateNormal];
            break;
    }
    
    return aaroButton;
}

@end
