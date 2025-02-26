//
//  CBAppConfig.h
//  CardBag
//
//  Created by Youe on 2022/12/13.
//

#ifndef CBAppConfig_h
#define CBAppConfig_h

#import <YYKit/YYKit.h>

#pragma mark -------------------------------------------- 颜色配置
// APP颜色
#define KAPPCOLOR [UIColor colorWithHexString:@"#DC143C"]
//#define KAPPCOLOR [UIColor colorWithHexString:@"#3CB371"]

// Controller背景色
#define kBACKGROUDcolor [UIColor colorWithHexString:@"#2F4F4F"]
// 字体颜色 #333333
#define TextColor_3 [UIColor colorWithHexString:@"#333333"]
// 字体颜色 #666666
#define TextColor_6 [UIColor colorWithHexString:@"#666666"]
// 字体颜色 #999999
#define TextColor_9 [UIColor colorWithHexString:@"#999999"]
// 线颜色深 #938C8D
#define LineColor_Dark [UIColor colorWithHexString:@"#938C8D"]


#define backgroundMeColor_Dark [UIColor colorWithHexString:@"#3CB371"]
#define backgroundOtherColor_Dark [UIColor colorWithHexString:@"#696969"]


#define unSelectColor_Dark [UIColor colorWithHexString:@"#90EE90"]
//分类普通状态颜色
#define normalColor_Dark [UIColor colorWithHexString:@"#D3D3D3"]

// button不能点击颜色
#define ButtonUnClickColor [UIColor colorWithRed:189/255.0 green:27/255.0 blue:45/255.0 alpha:0.5]


#pragma mark -------------------------------------------- 通知
#define CollectionViewSelectItemNotificationCenter     @"collectionViewSelectItemNotificationCenter"//expense 支出的通知
#define CollectionViewIncomeSelectItemNotificationCenter     @"collectionViewIncomeSelectItemNotificationCenter"//expense 支出的通知


#define XRFont(size) [UIFont systemFontOfSize:(size)]
#define XRBoldFont(size) [UIFont boldSystemFontOfSize:(size)]


#define XRColorRGBA(r, g, b, a)           [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:(a)]
#define XRColorRGB(r, g, b)               XRColorRGBA((r), (g), (b), 1.f)
#define XRColor0xRGB(rgb)                 XRColorRGBA((rgb) / 0x10000, ((rgb) % 0x10000) / 0x100, (rgb) % 0x100, 1.f)
#define XRColor0xRGBA(rgb, a)             XRColorRGBA((rgb) / 0x10000, ((rgb) % 0x10000) / 0x100, (rgb) % 0x100, a)
#define XRColor(c)                        XRColorRGBA((c), (c), (c), 1.f)
#define XRColorBlackWithAlpha(a)          [UIColor colorWithWhite:0.f alpha:a]
#define XRColorWhiteWithAlpha(a)          [UIColor colorWithWhite:1.f alpha:a]


#define XRTextGrayColor XRColorRGB(103, 103, 103)
#define XRTextGreenColor XRColorRGB(0, 179, 18)
#define XRTextRedColor XRColorRGB(218, 43, 48)
#define XRTextOrangeColor XRColorRGB(234, 144, 0)
#define XRTextBlueColor XRColorRGB(0, 122, 222)

#define XRBackgroundOrangeColor XRColorRGB(234, 149, 36)
#define XRBackgroundOrangeLightColor XRColorRGB(253, 224, 161)
#define XRBackgroundGrayColor XRColorRGB(228, 228, 228)


#define XRBackgroundLightGrayColor XRColor0xRGB(0xf5f5f5)
#define XRBackgroundRedColor XRColor0xRGB(0xD43745)

#define XRTextContentBlackColor XRColorRGB(84, 84, 84)
#define XRTextContentGrayColor XRColorRGB(161, 161, 161)



#define XRWidth [UIScreen mainScreen].bounds.size.width
#define XRHeight [UIScreen mainScreen].bounds.size.height


#pragma mark -------------------------------------------- URL配置

// http://117.173.87.125:7000/doc.html#/default/CTID%E8%AE%A4%E8%AF%81%E7%AE%A1%E7%90%86/authUsingPOST
// http://117.173.87.125:7000/doc.html#/home

// http://106.3.138.248:38100/ctidAuth/auth

/// 生产环境
//#define kApiPrefixCtidAuth  @"http://106.3.138.248:38100"
//#define kApiPrefixUnionMember  @"http://106.3.138.248:39500"

/// 测试环境
#define kApiPrefixCtidAuth  @"http://106.3.138.248:38003"
#define kApiPrefixUnionMember  @"http://106.3.138.248:37803"

///CTID认证
#define CtidAuth    @"/ctidAuth/auth"
///会员签发
#define MemberVerify    @"/unionMember/memberVerify"
///上链卡包的did信息
#define DidDocumentUpChain    @"/commonCard/didDocumentUpChain"
///导入卡包时根据根公钥hash获取上链信息接口
#define QueryByRootPublicKeyHash    @"/commonCard/queryByRootPublicKeyHash"
///根据did获取数字凭证
#define FindMemberDigitalIdentity    @"/member-digital-identity/find-member-digital-identitys-by-did"
///根据Id获取工会会员
#define FindUnionMember     @"/unionMember/find-union-member-by-id"
///根据Id获取职工会员
#define FindWorkerMember     @"/unionMember/find-worker-member-by-id"

//导入卡包时根据did获取上链信息接口
#define QueryByDid    @"/commonCard/queryByDid"

//根据数字凭证Id获取数字凭证
#define QueryKabaoDetailByDid    @"/member-digital-identity/find-member-digital-identity-by-id"

#endif /* CBAppConfig_h */
