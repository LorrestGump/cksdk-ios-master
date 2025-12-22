//
//  NaverIntegration.h
//  NaverIntegration
//
//  Created by LorrestGump on 2025/12/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CKSDKProtocalKit/CKSDKProtocalKit.h>

NS_ASSUME_NONNULL_BEGIN

// 内置 NaverGame v1.3.2

#define NaverInt [NaverIntegration shared]

@interface NaverIntegration : NSObject <ThirdLibDelegate>

+ (instancetype)shared;

/**
 `Naver` 初始化
 
 请在Info.plist设置初始化参数 NaverClientID,NaverClientSecret,NaverLoungeID,NaverScheme。
 */
- (void)setUp;

/**
 弹 NaverHall
 */
- (void)showView;

@end

NS_ASSUME_NONNULL_END
