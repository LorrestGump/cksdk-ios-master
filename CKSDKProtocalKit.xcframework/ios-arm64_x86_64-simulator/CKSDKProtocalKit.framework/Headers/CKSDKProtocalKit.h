//
//  CKSDKProtocalKit.h
//  CKSDKProtocalKit
//
//  Created by LorrestGump on 2025/12/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// typedef for CKSDKEvent
typedef NSString *CKSDKEvent;

/// 打开应用时上报，每次打开应用都需要上报
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventAppOpen;
/// 首次启动
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventFirstOpen;
/// 登录
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventLogin;
/// 注册
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventRegistration;
/// 创建角色
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventCreateRole;
/// 完成支付时上报，每次付费完成行为和金额，包括档位充值和其他所有付费，金额保留小数点后两位
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventPay;
/// 首充
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventFirstPurchase;
/// 二充
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventSecondPurchase;
/// 角色升级
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventLevelUp;
/// 看广告
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventShowAds;
/// 完成新手引导教程时计入
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventCompleteTutorial;
/// 赛季PVP玩法战斗完成。发起赛季PVP玩法并完成战斗时计入，重复计入
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventCompletePVP;
/// 加入军团。首次创建或加入军团时计入
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventJoinAlliance;
/// 每日活跃达到100时计入，重复计入
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventDailyActivity;
/// 购买0元购2000钻石档位时计入
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventDrporsche2000;
/// 点击查看购买界面
FOUNDATION_EXPORT CKSDKEvent const CKSDKEventInitCheckout;


#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kKeyWindowView [UIApplication sharedApplication].keyWindow.rootViewController.view

// 颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1)

//不考虑转屏的影响，只取竖屏（UIDeviceOrientationPortrait）的宽高
#define SCREEN_WIDTH MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)

// NSUserDefaults
#define UserDefaults  [NSUserDefaults standardUserDefaults]
#define SetOK(x,y)    [UserDefaults setObject:x forKey:y]
#define GetOK(x)      [UserDefaults objectForKey:x]

#define CheckNil(x) x!=nil?x:@""
#define InfoPlist(x) [NSBundle mainBundle].infoDictionary[x]

#define kFirstOpen      @"k_firstopen" // 首次启动
#define kLoginDayString @"k_logindaystring" // 日活统计
#define kPayCount       @"k_paycount" // 记录充值成功次数
//#define kAdsCount       @"k_AdsCount" // 记录看广告次数
#define kFCMToken       @"kfcm_token" // Firebase token
#define kFacebookUID    @"k_fbuid" // Facebook uid

#define kParamOid       @"oid" // 订单号
#define kParamGid       @"gid" // 商品ID
#define kParamPrice     @"price" // 价格
#define kParamGName     @"name" // 商品名称
#define kParamChannel   @"channel" // 渠道

#define kParamUName     @"username"
#define kParamEmail     @"email"
#define kParamUid       @"uid"
#define kParamAvatarUrl @"avatar_url"
#define kParamToken     @"token"
#define kParamTokenSecret @"token_secret"

#define kParamLevel     @"level"



typedef void(^BoolBlock)(BOOL value);
typedef void(^VBlock)(void);
typedef void(^DictBlock)(NSDictionary *data);
typedef void(^StringBlock)(NSString *string);
typedef void(^ArrayBlock)(NSArray * datas);


@protocol ThirdLibDelegate<NSObject>

- (void)setUp;
- (void)setCustomerUserId:(NSString *)uid;
- (void)loginSuccess:(DictBlock)sBlock
             failure:(VBlock)fBlock;

- (void)shareWithContent:(NSString *)content
                  result:(BoolBlock)resultBlock;
- (void)userInfoWithUserId:(NSString *)userId
                    params:(NSDictionary *)params
                   success:(DictBlock)sBlock
                   failure:(VBlock)fBlock;

- (void)logEventWithName:(NSString *)eventName
              parameters:(nullable NSDictionary *)parameters;

- (void)showView;

- (void)showAd:(NSString *)adid
      callback:(BoolBlock)callbackBlock;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
@end


NS_ASSUME_NONNULL_END
