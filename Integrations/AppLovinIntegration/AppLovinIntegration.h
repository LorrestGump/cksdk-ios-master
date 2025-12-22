//
//  AppLovinIntegration.h
//  AppLovinIntegration
//
//  Created by LorrestGump on 2025/12/15.
//

#import <Foundation/Foundation.h>
#import <CKSDKProtocalKit/CKSDKProtocalKit.h>

NS_ASSUME_NONNULL_BEGIN

#define AppLVInt [AppLovinIntegration shared]

@interface AppLovinIntegration : NSObject

+ (instancetype)shared;

/**
 `AppLovin` 初始化
 
 请在Info.plist设置初始化参数 AppLovinSdkKey 和 AppLovinAdId。
 */
- (void)setUp;

/**
 弹出视频广告页面。
 @param adid  广告单元id
 @param callbackBlock 结果回调
 */
-(void)showAd:(NSString *)adid
     callback:(BoolBlock)callbackBlock;

@end

NS_ASSUME_NONNULL_END
