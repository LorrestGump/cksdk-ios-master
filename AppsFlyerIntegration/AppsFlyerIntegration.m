//
//  CKSDKAppsFlyer.m
//  CKSDKAppsFlyer
//
//  Created by LorrestGump on 2025/11/28.
//

#import "AppsFlyerIntegration.h"

#import <AppsFlyerLib/AppsFlyerLib.h>


#if DEBUG
#define NSLog(FORMAT, ...) NSLog(@"[CKSDK-AppsFlyerIntegration] >> Function:%s Line:%d Content:%@\n", __FUNCTION__, __LINE__, [NSString stringWithFormat:FORMAT, ##__VA_ARGS__])
#else
#define NSLog(FORMAT, ...)
#endif

/**
 AppsFlyer是静态库，这里不能用Pod来导入，不然它代码和资源文件会并入到本动态库里
 */

@interface AppsFlyerIntegration ()
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation AppsFlyerIntegration

+ (instancetype)shared{
    static  AppsFlyerIntegration*  afext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == afext) {
            afext = [[AppsFlyerIntegration alloc] init];
        }
    });
    return afext;
}

- (void)setUp{
    
#if DEBUG
    [AppsFlyerLib shared].isDebug = true;
#endif
    [[AppsFlyerLib shared] waitForATTUserAuthorizationWithTimeoutInterval:60];
    [[AppsFlyerLib shared] setAppsFlyerDevKey:InfoPlist(@"AppsFlyerDevKey")];
    [[AppsFlyerLib shared] setAppleAppID:InfoPlist(@"AppleID")];
//       [AppsFlyerLib shared].delegate = self;

    [[AppsFlyerLib shared] start];
}

- (void)setCustomerUserId:(NSString *)uid{
    // 3、将访客ID设置到 AF 采集事件中
    NSDictionary *distinctData = @{@"ta_distinct_id": CheckNil(uid)};
    [[AppsFlyerLib shared] setAdditionalData:distinctData];
    // 4、强烈建议您使用 setCustomerUserId() 再设置一遍访客
    [AppsFlyerLib shared].customerUserID = uid;
}

- (void)logEventWithName:(NSString *)eventName
              parameters:(nullable NSDictionary *)parameters{
    if (eventName.length == 0)return;
    if ([eventName isEqualToString:CKSDKEventLogin]) {
        [[AppsFlyerLib shared] logEvent:AFEventLogin withValues:nil];
    }else if ([eventName isEqualToString:CKSDKEventRegistration]){
        [[AppsFlyerLib shared] logEvent:AFEventCompleteRegistration withValues:nil];
    }else if ([eventName isEqualToString:CKSDKEventPay]){
        NSString *oid = parameters[kParamOid];
        NSString *gid = parameters[kParamGid];
        NSString *gName = parameters[kParamGName];
        int price = [parameters[kParamPrice] intValue];
        [self logPurchaseWithOrderId:oid goodsName:gid goodsId:gName price:price];
    }else{
        [[AppsFlyerLib shared] logEvent:eventName withValues:parameters];
    }
}

- (void)logPurchaseWithOrderId:(NSString *)oid goodsName:(NSString *)gName goodsId:(NSString *)gid price:(int)price{
    NSDecimalNumber *amountDe = [[NSDecimalNumber decimalNumberWithString:@(price).stringValue] decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
    [[AppsFlyerLib shared] logEvent: AFEventPurchase
                       withValues:@{
      AFEventParamContentId:CheckNil(oid),
      AFEventParamContentType : CheckNil(gid),
      AFEventParamRevenue: amountDe,
      AFEventParamCurrency:@"USD"
    }];
    
    // 额外上报0.99档位
//    if ([amountDe.stringValue isEqualToString:@"0.99"]){
//        [[AppsFlyerLib shared] logEvent:@"0.99_goods" withValues:nil];
//    }
    // 上报所有档位充值
    [[AppsFlyerLib shared] logEvent:[NSString stringWithFormat:@"qq_%@_goods",amountDe.stringValue] withValues:nil];
    
    NSInteger paycount = [GetOK(kPayCount) integerValue];
    if (paycount > 2)return;
    if (paycount == 0) { // 首充
        [self logEventWithName:CKSDKEventFirstPurchase parameters:nil];
    }else if (paycount == 1){ // 二充
        [self logEventWithName:CKSDKEventSecondPurchase parameters:nil];
    }
    SetOK(@(paycount++), kPayCount);
}

@end


