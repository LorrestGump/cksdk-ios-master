//
//  AppDelegate.m
//  SDKDemo
//
//  Created by LorrestGump on 2025/12/1.
//

#import "AppDelegate.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <CKSDKCore/ConclusionKit.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // SDK相关设置，可选。
    // CKSDK设置H5游戏链接，非H5游戏请勿设置此属性。请在SDK初始化之前设置，链接请从SDK参数文档中获取。
//    CKSDK.glink = @"xxx";
    // 设置SDK是否开启苹果登录，默认为YES，无苹果登录请设置为NO。
//    CKSDK.hasAppleLogin = YES;
    // 隐私政策地址，接入Facebook需要设置，请从SDK参数文档中获取。
//    CKSDK.privacyURL = @"https://www.play569.com/?p=311";
    // 是否弹日本地区年龄询问框，上架到日本地区游戏需要将此属性设置为YES，不上日本不用设置此属性，默认为NO。
//    CKSDK.showJPAgeAsk = NO;
    
    [CKSDK application:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    [CKSDK application:app openURL:url options:options];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler{
    [CKSDK application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
    return YES;
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [CKSDK application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    // iOS14及以上版本需要先请求权限
    if (@available(iOS 14, *)) [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {}];
}

@end
