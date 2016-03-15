//
//  AaroPhoneNumberView.m
//  登录注册页面
//
//  Created by Lucky on 16/3/10.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import "AaroPhoneNumberView.h"

#import "UIView+Additon.h"



#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
/**
 *  本View的尺寸大小、距离上左右的边距
 *
 *  @return float
 */
//宽比例为 225/375 = 0.6
//高比例为 88/1334 = 0.66
//距离顶部距离 213/1334 = 0.16
#define kPhoneNumberViewWidth 0.733*([UIScreen mainScreen].bounds.size.width)
#define kPhoneNumberViewHeight 0.066*([UIScreen mainScreen].bounds.size.height)
#define kLeftGap ([UIScreen mainScreen].bounds.size.width*(1-0.733))/2
#define kTopGap 0.16*([UIScreen mainScreen].bounds.size.height)


/**
 *  smartPhoneIcon的尺寸
 */
#define kSmartPhoneWidth 0.133*([UIScreen mainScreen].bounds.size.width)

/**
 *  竖线的宽度
 *  @return float
 */
#define kVerticalLineWidth 0.5

/**
 *  手机号输入文本框的宽度
 */
#define kPhoneNumberTextFieldWidth 0.6*([UIScreen mainScreen].bounds.size.width)-6
#define kPhoneNumberTextFieldLeftGap 6
#define phoneNumberPlaceHolderString @"手机号码"

/**
 颜色
 
 - returns: HexColor
 */
#define AaroPhoneTextColor [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1]

/**
 圆角
 
 - returns: CGFloat
 */
static const CGFloat AaroCornerRadius = 4.0;


@interface AaroPhoneNumberView (){
    UIImageView *smartPhoneIcon;
    UIImageView *verticalLine;
//    UITextField *phoneNumberTextField;
}

@end
@implementation AaroPhoneNumberView
- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(kLeftGap, kTopGap, kPhoneNumberViewWidth, kPhoneNumberViewHeight);
        self.backgroundColor = AaroPhoneTextColor;
        //设置圆角
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:AaroCornerRadius];
        
        [self createSmartPhoneIcon];
        [self creatVerticalLine];
        [self creatPhoneNumberTextField];
        
        [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [self.layer setBorderWidth:.5];
    }
    return self;
}

- (void)createSmartPhoneIcon{
    smartPhoneIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kSmartPhoneWidth, kPhoneNumberViewHeight)];
    [self addSubview:smartPhoneIcon];
    
//#warning     此处要判断手机型号
    if (kHeight <=480) {
        smartPhoneIcon.image = [UIImage imageNamed:@"login_phone"];
    }
    else if (kHeight > 667) {
        smartPhoneIcon.image = [UIImage imageNamed:@"login_phone@3x"];
    }else{
        smartPhoneIcon.image = [UIImage imageNamed:@"login_phone@2x"];
    }
    
    smartPhoneIcon.contentMode = UIViewContentModeCenter;
    smartPhoneIcon.backgroundColor = AaroPhoneTextColor;
    
}

- (void)creatVerticalLine{
    verticalLine = [[UIImageView alloc] init];
    verticalLine.backgroundColor = [UIColor lightGrayColor];
    verticalLine.frame = CGRectMake(0, 0, kVerticalLineWidth, kPhoneNumberViewHeight);
    verticalLine.left = smartPhoneIcon.right;
    [self addSubview:verticalLine];
    
}

- (void)creatPhoneNumberTextField{
    _phoneNumberTextField = [[UITextField alloc] init];
    _phoneNumberTextField.backgroundColor = AaroPhoneTextColor;
    _phoneNumberTextField.frame = CGRectMake(0, 0, kPhoneNumberTextFieldWidth, kPhoneNumberViewHeight);
    _phoneNumberTextField.left = verticalLine.right + kPhoneNumberTextFieldLeftGap;
    [self addSubview:_phoneNumberTextField];
    _phoneNumberTextField.placeholder = phoneNumberPlaceHolderString;
    
}


@end
