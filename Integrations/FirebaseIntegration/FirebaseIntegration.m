//
//  FirebaseIntegration.m
//  FirebaseIntegration
//
//  Created by LorrestGump on 2025/12/4.
//

#import "FirebaseIntegration.h"
@import UserNotifications;
@import FirebaseCore;
@import FirebaseMessaging;

@import FirebaseAnalytics;

@interface FirebaseIntegration ()<FIRMessagingDelegate,UNUserNotificationCenterDelegate>

@end

@implementation FirebaseIntegration

+ (instancetype)shared{
    static  FirebaseIntegration*  firebext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == firebext) {
            firebext = [[FirebaseIntegration alloc] init];
//            [self reportFirstOpen];
        }
    });
    return firebext;
}

//+ (void)reportFirstOpen{
//    BOOL firstOpen = [[[NSUserDefaults standardUserDefaults] objectForKey:kFirstOpen] boolValue];
//    if (!firstOpen){
//        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:kFirstOpen];
//        [FIRAnalytics logEventWithName:CKSDKEventFirstOpen parameters:nil];
//    }
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    // [START configure_firebase]
    [FIRApp configure];
//    // [END configure_firebase]
//
//    // [START set_messaging_delegate]
    [FIRMessaging messaging].delegate = self;
    
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert |
        UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
    [[UNUserNotificationCenter currentNotificationCenter]
        requestAuthorizationWithOptions:authOptions
        completionHandler:^(BOOL granted, NSError * _Nullable error) {
          // ...
    }];

    [application registerForRemoteNotifications];
    return YES;
}

// [START refresh_token]
- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
    NSLog(@"FCM registration token: %@", fcmToken);
    // Notify about received token.
    NSDictionary *dataDict = [NSDictionary dictionaryWithObject:fcmToken forKey:@"token"];
    [[NSNotificationCenter defaultCenter] postNotificationName:
     @"FCMToken" object:nil userInfo:dataDict];
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new token is generated.
    if(fcmToken != nil)SetOK(fcmToken, kFCMToken);
}
// [END refresh_token]

- (void)logEventWithName:(NSString *)eventName parameters:(NSDictionary *)parameters{
    if ([eventName isEqualToString:CKSDKEventPay]){
        NSString *oid = parameters[kParamOid];
        NSString *gid = parameters[kParamGid];
        NSString *gName = parameters[kParamGName];
        int price = [parameters[kParamPrice] intValue];
        [self logPurchaseWithOrderId:oid goodsName:gName goodsId:gid price:price];
    }else{
        [FIRAnalytics logEventWithName:eventName parameters:parameters];
    }
}

- (void)logPurchaseWithOrderId:(NSString *)oid goodsName:(NSString *)gName goodsId:(NSString *)gid price:(int)price{
    NSDecimalNumber *amountDe = [[NSDecimalNumber decimalNumberWithString:@(price).stringValue] decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
    
    [FIRAnalytics logEventWithName:kFIREventAddPaymentInfo
                        parameters:@{
//        AnalyticsParameterCoupon:@"",
        kFIRParameterCoupon:CheckNil(gName),
//        AnalyticsParameterCurrency:@"",
        kFIRParameterCurrency:@"USD",
//        AnalyticsParameterItems,@"",
        kFIRParameterItemID:CheckNil(oid),
//        AnalyticsParameterPaymentType:@"",
        kFIRParameterPaymentType:CheckNil(gName),
//        AnalyticsParameterValue:@"",
        kFIRParameterValue:amountDe
    }];
}

//- (void)logLevelUp:(NSInteger)level{
//    if (level%10 == 0){
////        NSString *infostr = [NSString stringWithFormat:@"archive_level_%d",level];
//        NSString *infostr1 = [NSString stringWithFormat:@"qq_%ld_level",(long)level];
//        [FIRAnalytics logEventWithName:infostr1 parameters:nil];
//    }
//}

@end
