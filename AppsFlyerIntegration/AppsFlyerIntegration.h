//
//  CKSDKAppsFlyer.h
//  CKSDKAppsFlyer
//
//  Created by LorrestGump on 2025/11/28.
//

#import <Foundation/Foundation.h>
//#import <CKSDKProtocalKit/CKSDKProtocalKit.h>
#import "CKSDKProtocalKit.h"


#define AFInt [AppsFlyerIntegration shared]

NS_ASSUME_NONNULL_BEGIN



@interface AppsFlyerIntegration : NSObject <ThirdLibDelegate>

+ (instancetype)shared;

/**
 初始化 `AppsFlyer`
 
 请在Info.plist设置初始化参数 AppleID 和 AppsFlyerDevKey。
 */
- (void)setUp;
/**
 设置访客ID
 */
- (void)setCustomerUserId:(NSString *)uid;
/**
 事件上报
 
 @param eventName 事件名
 @param parameters 字典类型事件参数
 */
- (void)logEventWithName:(NSString *)eventName
              parameters:(nullable NSDictionary *)parameters;
/**
 支付上报
 @param oid 订单号
 @param gname 商品名
 @param gid 商品ID
 @param price 商品价格(单位：分)
 */
//- (void)logPurchaseWithOrderId:(NSString *)oid
//                     goodsName:(NSString *)gname
//                       goodsId:(NSString *)gid
//                         price:(int)price;

@end

NS_ASSUME_NONNULL_END
