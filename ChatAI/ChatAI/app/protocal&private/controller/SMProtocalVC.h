//
//  SMProtocalVC.h
//  SimpleDiary
//
//  Created by APPLE on 2022/4/11.
//

#import "BaseTemplateVC.h"

#import "SMProtocalView.h"


NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    DetailTypePrivacyPolicy,  //隐私政策
    DetailTypeServiceAgreement,  //服务协议
} DetailType;

@interface SMProtocalVC : BaseTemplateVC

@property (nonatomic,strong)SMProtocalView *protocalView;
@property (nonatomic , assign) DetailType detaiType;

@end

NS_ASSUME_NONNULL_END
