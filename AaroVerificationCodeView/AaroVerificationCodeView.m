//
//  AaroVerificationCodeView.m
//  登录注册页面
//
//  Created by Lucky on 16/3/11.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import "AaroVerificationCodeView.h"
#import "UIView+Additon.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

/**
 *  本View的基本大小、距离上左右的边距
 *
 *  @return float
 */
//宽比例为 225/375 = 0.6
//高比例为 88/1334 = 0.66
//距离顶部距离 213/1334 = 0.16
#define kVerificationViewWidth 0.733*([UIScreen mainScreen].bounds.size.width)
#define kVerificationViewHeight 0.066*([UIScreen mainScreen].bounds.size.height)
#define kLeftGap ([UIScreen mainScreen].bounds.size.width*(1-0.733))/2
#define kTopGap 0.2406*([UIScreen mainScreen].bounds.size.height)


/**
 *  loginCode小盾牌的尺寸
 */
#define kLoginCodeIconWidth 0.133*([UIScreen mainScreen].bounds.size.width)

/**
 *  竖线的宽度
 *  @return float
 */
#define kVerticalLineWidth 0.5

/**
 *  密码输入文本框的宽度
 */
#define kCodeTextFieldWidth 0.493*([UIScreen mainScreen].bounds.size.width)-6
#define kCodeTextFieldLeftGap 6
#define kCodeTextFieldRightWithButtonGap 5


/**
 *  验证码按钮的尺寸
 */
#define kCodeButtonWidth 0.2267*([UIScreen mainScreen].bounds.size.width)



/**
 颜色
 
 - returns: HexColor
 */
#define AaroVerificationCodeTextFieldColor [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1]
#define AaroVerificationCodeButtonBorderColor [UIColor colorWithRed:2.0/255.0 green:170.0/255.0 blue:238.0/255.0 alpha:1].CGColor
#define AaroVerificationCodeButtonColor [UIColor colorWithRed:2.0/255.0 green:170.0/255.0 blue:238.0/255.0 alpha:1]
/**
 圆角
 
 - returns: CGFloat
 */

static const CGFloat AaroCornerRadius = 4.0;

/**
 *  验证码输入框placeHolder
 *
 *  @return NSString
 */

#define CodeTextFieldPlaceHolder @"输入验证码"


/**
 *  LeftView的尺寸
 *
 *  @return float
 */
#define kLeftViewWidth 0.493*([UIScreen mainScreen].bounds.size.width)

@interface AaroVerificationCodeView (){
    UIView *leftView;
    UIImageView *loginCodeIcon;
    UIImageView *verticalLine;
//    UITextField *verificationCodeTextField;
//    UIButton *codeButton;
}

@end

@implementation AaroVerificationCodeView

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(kLeftGap, kTopGap, kVerificationViewWidth, kVerificationViewHeight);
        self.backgroundColor = [UIColor clearColor];
        [self createLeftView];
        [self createCodeButton];
    }
    return self;
}
#pragma mark - Public
- (void)createLeftView{
    leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kLeftViewWidth, kVerificationViewHeight)];
    [self addSubview:leftView];
    leftView.backgroundColor = AaroVerificationCodeTextFieldColor;
    
    [leftView.layer setMasksToBounds:YES];
    [leftView.layer setCornerRadius:AaroCornerRadius];
    
    [leftView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [leftView.layer setBorderWidth:.5];


    loginCodeIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kLoginCodeIconWidth, kVerificationViewHeight)];
//#warning     此处要判断手机型号
    if (kWidth <=480) {
        loginCodeIcon.image = [UIImage imageNamed:@"login_code"];
    }
    else if (kWidth > 667) {
        loginCodeIcon.image = [UIImage imageNamed:@"login_code@3x"];
    }else{
        loginCodeIcon.image = [UIImage imageNamed:@"login_code@2x"];
    }
    
    loginCodeIcon.contentMode = UIViewContentModeCenter;
    loginCodeIcon.backgroundColor = AaroVerificationCodeTextFieldColor;
    [leftView addSubview:loginCodeIcon];
    
    
    verticalLine = [[UIImageView alloc] init];
    verticalLine.backgroundColor = [UIColor lightGrayColor];
    verticalLine.frame = CGRectMake(0, 0, kVerticalLineWidth, kVerificationViewHeight);
    verticalLine.left = loginCodeIcon.right;
    [leftView addSubview:verticalLine];
    
    _verificationCodeTextField = [[UITextField alloc] init];
    _verificationCodeTextField.backgroundColor = AaroVerificationCodeTextFieldColor;
    _verificationCodeTextField.frame = CGRectMake(0, 0, kCodeTextFieldWidth, kVerificationViewHeight);
    _verificationCodeTextField.left = verticalLine.right + kCodeTextFieldLeftGap;
    _verificationCodeTextField.placeholder = CodeTextFieldPlaceHolder;
    [leftView addSubview:_verificationCodeTextField];
    
    
    [leftView.layer setMasksToBounds:YES];
    [leftView.layer setCornerRadius:AaroCornerRadius];
}


#pragma mark - Public
- (void)createCodeButton{
    _codeButton = [[UIButton alloc] init];
    _codeButton.frame = CGRectMake(0, 0, kCodeButtonWidth, kVerificationViewHeight);
    _codeButton.left = leftView.right + kCodeTextFieldRightWithButtonGap;
    [_codeButton setBackgroundColor:[UIColor clearColor]];
    [_codeButton.layer setBorderColor:AaroVerificationCodeButtonBorderColor];
    [_codeButton.layer setBorderWidth:.8];
    [_codeButton.layer setMasksToBounds:YES];
    [_codeButton.layer setCornerRadius:AaroCornerRadius];
    
    [_codeButton setTitle:@"验证码" forState:UIControlStateNormal];
    [_codeButton setTitleColor:AaroVerificationCodeButtonColor forState:UIControlStateNormal];
//    #warning 屏幕适配
    if (kHeight <667) {
        _codeButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];//黑粗体
    }
    else{
        _codeButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];//黑粗体20
    }
    
    
    [self addSubview:_codeButton];
    
}

@end
