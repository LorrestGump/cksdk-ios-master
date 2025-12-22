//
//  AppLovinIntegration.m
//  AppLovinIntegration
//
//  Created by LorrestGump on 2025/12/15.
//

#import "AppLovinIntegration.h"
#import <AppLovinSDK/AppLovinSDK.h>

@interface AppLovinIntegration ()<MARewardedAdDelegate,MAAdRevenueDelegate>
@property (nonatomic, strong) MARewardedAd *rewardedAd;
@property (nonatomic, assign) NSInteger retryAttempt;
@property (copy, nonatomic) BoolBlock showAdBlock;
@end

@implementation AppLovinIntegration

+ (instancetype)shared{
    static  AppLovinIntegration*  applv = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == applv) {
            applv = [[AppLovinIntegration alloc] init];
//            [applv loadAdid:InfoPlist(GADAdidKey) completionHandler:^(GADRewardedAd * _Nullable rewardedAd, NSError * _Nullable error) {}];
        }
    });
    return applv;
}

- (void)setUp{
    // Create the initialization configuration
    ALSdkInitializationConfiguration *initConfig = [ALSdkInitializationConfiguration configurationWithSdkKey: InfoPlist(@"AppLovinSdkKey") builderBlock:^(ALSdkInitializationConfigurationBuilder *builder) {

        builder.mediationProvider = ALMediationProviderMAX;
        
        // Enable test mode by default for the current device.
        NSString *currentIDFV = UIDevice.currentDevice.identifierForVendor.UUIDString;
        if ( currentIDFV.length > 0 )
        {
            builder.testDeviceAdvertisingIdentifiers = @[currentIDFV];
        }
    }];

    // Initialize the SDK with the configuration
    [[ALSdk shared] initializeWithConfiguration: initConfig completionHandler:^(ALSdkConfiguration *sdkConfig) {
        // AppLovin SDK is initialized, start loading ads now or later if ad gate is reached
        
        // Initialize Adjust SDK
//        ADJConfig *adjustConfig = [[ADJConfig alloc] initWithAppToken: @"{YourAppToken}" environment: ADJEnvironmentSandbox];
//        [Adjust initSdk: adjustConfig];
    }];
    
    // 预加载广告
    [self preloadAd:InfoPlist(@"AppLovinAdId")];
}

- (void)preloadAd:(NSString *)adid{
    self.rewardedAd = [MARewardedAd sharedWithAdUnitIdentifier: adid];
        
    self.rewardedAd.delegate = self;
    self.rewardedAd.revenueDelegate = self;
    
    // Load the first ad
    [self.rewardedAd loadAd];
}

- (void)showAd:(NSString *)adid callback:(BoolBlock)callbackBlock{
    self.showAdBlock = callbackBlock;
    if ( [self.rewardedAd isReady] ){
        [self.rewardedAd showAd];
    }
}

#pragma mark - MAAdDelegate Protocol

- (void)didLoadAd:(MAAd *)ad
{
    // Rewarded ad is ready to be shown. '[self.rewardedAd isReady]' will now return 'YES'
//    [self logCallback: __PRETTY_FUNCTION__];
    NSLog(@"didLoadAd");
    
    // Reset retry attempt
    self.retryAttempt = 0;
}

- (void)didFailToLoadAdForAdUnitIdentifier:(NSString *)adUnitIdentifier withError:(MAError *)error
{
//    [self logCallback: __PRETTY_FUNCTION__];
    NSLog(@"didFailToLoadAdForAdUnitIdentifier:%@\nError:%@",adUnitIdentifier,error);
    
    // Rewarded ad failed to load. We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds).
    
    self.retryAttempt++;
    NSInteger delaySec = pow(2, MIN(6, self.retryAttempt));
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delaySec * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.rewardedAd loadAd];
    });
}

- (void)didDisplayAd:(MAAd *)ad
{
//    [self logCallback: __PRETTY_FUNCTION__];
    NSLog(@"didDisplayAd");
    if (self.showAdBlock) {
        self.showAdBlock(YES);
    }
}

- (void)didClickAd:(MAAd *)ad
{
//    [self logCallback: __PRETTY_FUNCTION__];
    NSLog(@"didClickAd");
}

- (void)didHideAd:(MAAd *)ad
{
//    [self logCallback: __PRETTY_FUNCTION__];
    NSLog(@"didHideAd");
    
    // Rewarded ad is hidden. Pre-load the next ad
    [self.rewardedAd loadAd];
}

- (void)didFailToDisplayAd:(MAAd *)ad withError:(MAError *)error
{
//    [self logCallback: __PRETTY_FUNCTION__];
    NSLog(@"didFailToDisplayAd");
    
    // Rewarded ad failed to display. We recommend loading the next ad
    [self.rewardedAd loadAd];
}

#pragma mark - MARewardedAdDelegate Protocol

- (void)didRewardUserForAd:(MAAd *)ad withReward:(MAReward *)reward
{
    // Rewarded ad was displayed and user should receive the reward
//    [self logCallback: __PRETTY_FUNCTION__];
    NSLog(@"didRewardUserForAd");
}

#pragma mark - MAAdRevenueDelegate Protocol

//- (void)didPayRevenueForAd:(MAAd *)ad
//{
//    [self logCallback: __PRETTY_FUNCTION__];
//    NSLog(@"AppLovin");
    
//    ADJAdRevenue *adjustAdRevenue = [[ADJAdRevenue alloc] initWithSource: @"applovin_max_sdk"];
//    [adjustAdRevenue setRevenue: ad.revenue currency: @"USD"];
//    [adjustAdRevenue setAdRevenueNetwork: ad.networkName];
//    [adjustAdRevenue setAdRevenueUnit: ad.adUnitIdentifier];
//    [adjustAdRevenue setAdRevenuePlacement: ad.placement];
//
//    [Adjust trackAdRevenue: adjustAdRevenue];
//}

@end
