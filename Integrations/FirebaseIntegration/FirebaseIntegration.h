//
//  FirebaseIntegration.h
//  FirebaseIntegration
//
//  Created by LorrestGump on 2025/12/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CKSDKProtocalKit/CKSDKProtocalKit.h>


NS_ASSUME_NONNULL_BEGIN

#define FireBInt [FirebaseIntegration shared]

@interface FirebaseIntegration : NSObject <ThirdLibDelegate>

+ (instancetype)shared;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


/**
 事件上报
 
 @param eventName 事件名
 @param parameters 字典类型事件参数
 */
- (void)logEventWithName:(NSString *)eventName
              parameters:(nullable NSDictionary<NSString *, id> *)parameters;

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

/**
 角色升级上报
 @param level 角色等级
 */
//- (void)logLevelUp:(NSInteger)level;
@end

NS_ASSUME_NONNULL_END
