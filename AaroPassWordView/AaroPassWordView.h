//
//  AaroPassWordView.h
//  登录注册页面
//
//  Created by Lucky on 16/3/11.
//  Copyright © 2016年 AaronTKD_GEELY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,AaroPassWordType){
    AaroPassWordTypeLogin,  //登陆页面密码样式
    AaroPassWordTypeChangeSetNew,  //修改密码页面，设置新密码样式
    AaroPassWordTypeChangeConfirmNew,  //修改密码页面，确认新密码样式
    AaroPassWordTypeRegisterConfirmSetNew,  //完成注册页面，设置密码样式
};
@interface AaroPassWordView : UIView
@property (nonatomic,strong) UITextField *passWordTextField;
@property (nonatomic,strong) UIButton *openEyeButton;
//- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new  UNAVAILABLE_ATTRIBUTE;
+ (instancetype)passWordViewWithType:(AaroPassWordType)passWordType;
@end
