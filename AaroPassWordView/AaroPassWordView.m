//
//  AaroPassWordView.m
//  登录注册页面
//
//  Created by Lucky on 16/3/11.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import "AaroPassWordView.h"
#import "UIView+Additon.h"




#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#pragma MARK - PUBLIC SIZE
/**
 *  本View的基本大小、距离上左右的边距
 *
 *  @return float
 */
//宽比例为 225/375 = 0.6
//高比例为 88/1334 = 0.66
//距离顶部距离 213/1334 = 0.16
#define kPassWordViewWidth 0.733*([UIScreen mainScreen].bounds.size.width)
#define kPassWordViewHeight 0.066*([UIScreen mainScreen].bounds.size.height)
#define kLeftGap ([UIScreen mainScreen].bounds.size.width*(1-0.733))/2


/**
 *  loginLockIcon的尺寸
 */
#define kLoginLockIconWidth 0.133*([UIScreen mainScreen].bounds.size.width)

/**
 *  竖线的宽度
 *  @return float
 */
#define kVerticalLineWidth 0.5

/**
 *  密码输入文本框的宽度
 */
#define kPassWordTextFieldWidth 0.6*([UIScreen mainScreen].bounds.size.width)-6
#define kPassWordTextFieldLeftGap 6


/**
 *  眼睛按钮的尺寸
 */
#define kOpenEyeWidth 0.0467*([UIScreen mainScreen].bounds.size.width)
#define kOpenEyeHeight 0.015*([UIScreen mainScreen].bounds.size.width)
#define kOpenEyeRightGap 0.0267*([UIScreen mainScreen].bounds.size.width)

/**
 颜色
 
 - returns: HexColor
 */
#define AaroPassWordTextColor [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1]

/**
 圆角
 
 - returns: CGFloat
 */
static const CGFloat AaroCornerRadius = 4.0;


#pragma MARK - PRIVATE SIZE
/**
 AaroPassWordStyleLogin,
 AaroPassWordStyleChangeSetNew,
 AaroPassWordStyleChangeConfirmNew,
 AaroPassWordStyleRegisterConfirmSetNew,
 *
 */
#define kLoginTopGap 0.241*([UIScreen mainScreen].bounds.size.height)
#define kChangeSetNewGap 0.16*([UIScreen mainScreen].bounds.size.height)
#define kChangeConfirmNewGap 0.2406*([UIScreen mainScreen].bounds.size.height)
#define kRegisterConfirmSetNewGap 0.3216*([UIScreen mainScreen].bounds.size.height)

#define LoginPlaceHolderString @"密码"
#define ChangeSetNewPlaceHolderString @"新密码(6-16位数字或字母)"
#define ChangeConfirmNewPlaceHolderString @"确认新密码"
#define RegisterConfirmSetNewPlaceHolderString @"设置密码(6-16位数字或字母)"

@interface AaroPassWordView (){
    UIImageView *loginLockIcon;
    UIImageView *verticalLine;
//    UITextField *passWordTextField;
//    UIButton *openEyeButton;
}

@end

@implementation AaroPassWordView
+ (instancetype)passWordViewWithType:(AaroPassWordType)passWordType{
    AaroPassWordView *passWordView = [[AaroPassWordView alloc] init];
    passWordView.backgroundColor = AaroPassWordTextColor;
    
    //圆角
    [passWordView.layer setMasksToBounds:YES];
    [passWordView.layer setCornerRadius:AaroCornerRadius];
    [passWordView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [passWordView.layer setBorderWidth:.5];
    
    [passWordView createLoginLockIcon];
    [passWordView createVerticalLine];


    switch (passWordType) {
        case AaroPassWordTypeLogin:
            passWordView.frame = CGRectMake(kLeftGap, kLoginTopGap, kPassWordViewWidth, kPassWordViewHeight);
            [passWordView createPassWordTextField:LoginPlaceHolderString];
            break;
        case AaroPassWordTypeChangeSetNew:
            passWordView.frame = CGRectMake(kLeftGap, kChangeSetNewGap, kPassWordViewWidth, kPassWordViewHeight);
            [passWordView createPassWordTextField:ChangeConfirmNewPlaceHolderString];
            break;
            
        case AaroPassWordTypeChangeConfirmNew:
            passWordView.frame = CGRectMake(kLeftGap, kChangeConfirmNewGap, kPassWordViewWidth, kPassWordViewHeight);
            [passWordView createPassWordTextField:ChangeConfirmNewPlaceHolderString];
            break;
        case AaroPassWordTypeRegisterConfirmSetNew:
            passWordView.frame = CGRectMake(kLeftGap, kRegisterConfirmSetNewGap, kPassWordViewWidth, kPassWordViewHeight);
            [passWordView createPassWordTextField:RegisterConfirmSetNewPlaceHolderString];
            break;
    }
    
    [passWordView createOpenEyesIcon];
    return passWordView;
}

- (void)createLoginLockIcon{
    loginLockIcon = [[UIImageView alloc] init];
    loginLockIcon.frame = CGRectMake(0, 0, kLoginLockIconWidth, kPassWordViewHeight);
    loginLockIcon.backgroundColor = AaroPassWordTextColor;
//#warning 判断iPhone大小
    if (kWidth <=480) {
        loginLockIcon.image = [UIImage imageNamed:@"login_Locked"];
    }
    else if (kWidth > 667) {
        loginLockIcon.image = [UIImage imageNamed:@"login_Locked@3x"];
    }else{
        loginLockIcon.image = [UIImage imageNamed:@"login_Locked@2x"];
    }
    
    loginLockIcon.contentMode = UIViewContentModeCenter;
    [self addSubview:loginLockIcon];
}
- (void)createVerticalLine{
    verticalLine = [[UIImageView alloc] init];
    verticalLine.backgroundColor = [UIColor lightGrayColor];
    verticalLine.frame = CGRectMake(0, 0, kVerticalLineWidth, kPassWordViewHeight);
    verticalLine.left = loginLockIcon.right;
    [self addSubview:verticalLine];
}
- (void)createPassWordTextField:(NSString *)placeHolder{
    _passWordTextField = [[UITextField alloc] init];
    _passWordTextField.backgroundColor = AaroPassWordTextColor;
    _passWordTextField.frame = CGRectMake(0, 0, kPassWordTextFieldWidth, kPassWordViewHeight);
    _passWordTextField.left = verticalLine.right + kPassWordTextFieldLeftGap;
    [self addSubview:_passWordTextField];
    _passWordTextField.placeholder = placeHolder;
}
- (void)createOpenEyesIcon{
    _openEyeButton = [[UIButton alloc] init];
    _openEyeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//#warning 判断iPhone大小
    if (kHeight <=480) {
        [_openEyeButton setImage:[UIImage imageNamed:@"password_close"] forState:UIControlStateNormal];
    }
    else if (kHeight > 667) {
        [_openEyeButton setImage:[UIImage imageNamed:@"password_close@3x"] forState:UIControlStateNormal];
    }else{
        [_openEyeButton setImage:[UIImage imageNamed:@"password_close@2x"] forState:UIControlStateNormal];
    }
    
    
    _openEyeButton.frame = CGRectMake(0, 0, kOpenEyeWidth, kOpenEyeHeight);
//    openEyeButton.right = passWordTextField.right - kOpenEyeRightGap;
    _passWordTextField.rightView = _openEyeButton;
    _passWordTextField.rightViewMode = UITextFieldViewModeWhileEditing;
}
@end
