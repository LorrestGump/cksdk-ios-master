//
//  FacebookIntegration.h
//  FacebookIntegration
//
//  Created by LorrestGump on 2025/12/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CKSDKProtocalKit/CKSDKProtocalKit.h>


NS_ASSUME_NONNULL_BEGIN

#define FaceBInt [FacebookIntegration shared]


@interface FacebookIntegration : NSObject <ThirdLibDelegate>

@property (copy, nonatomic) BoolBlock fbShareResultBlock;
@property (copy, nonatomic) VBlock fbBindResultBlock;

+ (instancetype)shared;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
/**
 Facebook 登录
 @param sBlock 登录成功回调
 @param fBlock 登录失败回调
 */
- (void)loginSuccess:(DictBlock)sBlock failure:(VBlock)fBlock;

/**
 获取 Facebook 登录用户信息，需要先登录 Facebook。
 
 NSDictionary*params= @{@"fields":@"id,name,email,age_range,first_name,last_name,link,gender,locale,picture,timezone,updated_time,verified"};
 
 @param userId Facebook userID
 @param params 请求参数，配置需要获取的信息
 @param sBlock 返回获取信息
 @param fBlock 失败回调
 */
- (void)userInfoWithUserId:(NSString *)userId params:(NSDictionary *)params success:(DictBlock)sBlock failure:(VBlock)fBlock;
/**
 Facebook分享
 @param content 分享文本内容
 @param resultBlock 分享结果回调
 */
- (void)shareWithContent:(NSString *)content result:(BoolBlock)resultBlock;

/**
 设置绑定Facebook登录成功回调，取消绑定和绑定失败不会回调
 */
- (void)setBindFacebookSuccessCallback:(VBlock)result;

/**
 事件上报
 @param eventName 事件名
 @param parameters 字典类型事件参数
 */
- (void)logEventWithName:(NSString *)eventName
              parameters:(nullable NSDictionary<NSString *, id> *)parameters;
@end

NS_ASSUME_NONNULL_END
