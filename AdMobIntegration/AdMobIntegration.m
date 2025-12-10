//
//  AdMobIntegration.m
//  AdMobIntegration
//
//  Created by LorrestGump on 2025/12/4.
//

#import "AdMobIntegration.h"
@import GoogleMobileAds;

@implementation AdMobIntegration

+ (instancetype)shared{
    static  AdMobIntegration*  adext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == adext) {
            adext = [[AdMobIntegration alloc] init];
        }
    });
    return adext;
}

- (void)loadAdid:(NSString *)adid completionHandler:(GADRewardedAdLoadCompletionHandler)completionHandler{
    GADRequest *request = [GADRequest request];
    [GADRewardedAd
         loadWithAdUnitID:adid
                  request:request
        completionHandler:^(GADRewardedAd *ad, NSError *error) {
        if (error) {
            NSLog(@"广告单元预加载失败ID = %@, error: %@",adid, [error localizedDescription]);
        }else{

            NSLog(@"广告单元预加载成功ID = %@",adid);
        }
        if (completionHandler){
            completionHandler(ad,error);
        }
    }];
}

- (void)closeAdTipsView:(UIButton *)btn{
    [btn.superview removeFromSuperview];
}

/**
 弹出谷歌视频广告页面
 */
-(void)showGoogleAd:(NSString *)adid  callback:(BoolBlock)callbackBlock{
//    NSLog(@"GoogleADID: %@", adid);
    
    [self loadAdid:adid completionHandler:^(GADRewardedAd * _Nullable rewardedAd, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Rewarded ad failed to load with error: %@", [error localizedDescription]);
            NSLog(@"广告单元预加载失败ID = %@, error: %@",adid, [error localizedDescription]);
            if (callbackBlock) callbackBlock(NO);
            return;
        }
        NSLog(@"Rewarded ad loaded.");
        NSLog(@"广告单元预加载成功ID = %@",adid);
        // 检查是否能弹出
        UIViewController *rootvc = [UIApplication sharedApplication].keyWindow.rootViewController;
        NSError *er;
        BOOL canpre = [rewardedAd canPresentFromRootViewController:rootvc error:&er];
        if (!canpre){
            NSLog(@"无法弹广告，报错：%@",er);
            if (callbackBlock) callbackBlock(NO);
            return;
        }
        
        if (rewardedAd) {
            [rewardedAd presentFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController
                             userDidEarnRewardHandler:^{
                // TODO: Reward the user!
            }];
            if (callbackBlock) callbackBlock(YES);
        } else {
            NSLog(@"Ad wasn't ready");
            if (callbackBlock) callbackBlock(NO);
        }
    }];
}


/// Tells the delegate that the ad failed to present full screen content.
//- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
//didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
//    NSLog(@"Ad did fail to present full screen content.");
//    if (self.adCallbackBlock) {
//        self.adCallbackBlock(NO);
//    }
//}
//
///// Tells the delegate that the ad presented full screen content.
//- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
//    NSLog(@"Ad did present full screen content.");
//}
//
///// Tells the delegate that the ad dismissed full screen content.
//- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
//   NSLog(@"Ad did dismiss full screen content.");
//    if (self.adCallbackBlock) {
//        self.adCallbackBlock(YES);
//    }
//}

@end
