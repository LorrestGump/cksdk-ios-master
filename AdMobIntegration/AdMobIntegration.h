//
//  AdMobIntegration.h
//  AdMobIntegration
//
//  Created by LorrestGump on 2025/12/4.
//

#import <Foundation/Foundation.h>
#import <CKSDKProtocalKit/CKSDKProtocalKit.h>


NS_ASSUME_NONNULL_BEGIN

#define AdMobInt [AdMobIntegration shared]

#define AdMob_TestID    @"ca-app-pub-3940256099942544/1712485313" // 广告测试单元ID，测试谷歌广告时可传此ID

typedef void(^BoolBlock)(BOOL value);

@interface AdMobIntegration : NSObject <ThirdLibDelegate>

+ (instancetype)shared;

/**
 弹出谷歌视频广告页面。
 
 测试阶段可能无法获取到广告，可传 `AdMob_TestID` 作为测试广告单元ID。
 @param adid  广告单元id
 */
-(void)showAd:(NSString *)adid
     callback:(BoolBlock)callbackBlock;

@end

NS_ASSUME_NONNULL_END
