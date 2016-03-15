//
//  AaroAgreementView.m
//  登录注册页面
//
//  Created by Lucky on 16/3/11.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import "AaroAgreementView.h"
#import "UIView+Additon.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

/**
 *  View的尺寸
 */
#define kAaroAgreementViewWidth [UIScreen mainScreen].bounds.size.width
#define kAaroAgreementViewHeight 0.058*[UIScreen mainScreen].bounds.size.height
/**
 *  informationLabel的尺寸
 */
#define kInformationLabelWidth [UIScreen mainScreen].bounds.size.width
#define kInformationLabelHeight 0.019*[UIScreen mainScreen].bounds.size.height
#define kInformationLabelGapWithButton 0.0052*[UIScreen mainScreen].bounds.size.height

#define informateTextString @"轻触“注册”按钮，即表示您同意"
#define informateTextColor [UIColor colorWithRed:74.0/255.0 green:74.0/255.0 blue:74.0/255.0 alpha:1]

/**
 *  agreementButton的尺寸
 */
#define kAgreementButtonWidth 0.288*[UIScreen mainScreen].bounds.size.width+40
#define kAgreementButtonHeight 0.019*[UIScreen mainScreen].bounds.size.height
#define kAgreementButtonGapWithBottom 0.015*[UIScreen mainScreen].bounds.size.height
#define kAgreementButtonLeftGap 0.356*[UIScreen mainScreen].bounds.size.width-20

#define agreementButtonTitle @"《车友宝用户协议》"
#define agreementButtonTitleColor [UIColor colorWithRed:2.0/255.0 green:170.0/255.0 blue:238.0/255.0 alpha:1]
@interface AaroAgreementView (){
    UILabel *informationLabel;
//    UIButton *agreementButton;
}

@end

@implementation AaroAgreementView

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0, kHeight-kAaroAgreementViewHeight, kAaroAgreementViewWidth, kAaroAgreementViewHeight);
        [self createInformationLabel];
        [self createAgreementButton];
    }
    return self;
}
- (void)createInformationLabel{
    informationLabel = [[UILabel alloc] init];
    informationLabel.frame = CGRectMake(0, 0, kInformationLabelWidth, kInformationLabelHeight);
    
    informationLabel.text = informateTextString;
    informationLabel.textColor = informateTextColor;
    informationLabel.textAlignment = NSTextAlignmentCenter;
    informationLabel.backgroundColor = [UIColor clearColor];
//#warning 屏幕字体适配
    if (kHeight == 480) {
        informationLabel.font = [UIFont systemFontOfSize:6];
    }else if (kHeight == 568){
        informationLabel.font = [UIFont systemFontOfSize:9];
    }else{
        informationLabel.font = [UIFont systemFontOfSize:12];
    }

    [self addSubview:informationLabel];
}
- (void)createAgreementButton{
    _agreementButton = [[UIButton alloc] init];
    _agreementButton.frame = CGRectMake(kAgreementButtonLeftGap, informationLabel.bottom + kInformationLabelGapWithButton, kAgreementButtonWidth, kAgreementButtonHeight);

    
    [_agreementButton setTitle:agreementButtonTitle forState:UIControlStateNormal];
    _agreementButton.backgroundColor = [UIColor clearColor];
    
    
    [_agreementButton setTitleColor:agreementButtonTitleColor forState:UIControlStateNormal];
//#warning 屏幕字体适配
    if (kHeight == 480) {
        _agreementButton.titleLabel.font = [UIFont systemFontOfSize:6];
    }else if (kHeight == 568){
        _agreementButton.titleLabel.font = [UIFont systemFontOfSize:9];
    }else{
        _agreementButton.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    [self addSubview:_agreementButton];
    
}

@end
