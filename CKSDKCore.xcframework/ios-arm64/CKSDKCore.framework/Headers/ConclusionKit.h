#import <UIKit/UIKit.h>

#ifndef Unity_iPhone_sdkCommon_h
#define Unity_iPhone_sdkCommon_h

typedef void(^BoolBlock)(BOOL value);
typedef void(^VBlock)(void);
typedef void(^ArrayBlock)(NSArray * datas);

typedef void(^LoginResultBlock)(BOOL result, NSDictionary *userdata);

@interface XMUser : NSObject
@property (copy, nonatomic) NSString *userId;  // 用户id
@property (copy, nonatomic) NSString *userName; // 用户名
@property (copy, nonatomic) NSString *token;
@property (strong, nonatomic) NSString *brithday; // 生日
@property (strong, nonatomic) NSString *age; // 年龄
@property (retain, nonatomic) NSString *pi;

@property (strong, nonatomic) NSString *liveid; // 会话id,keeplive 参数为1时，可传递此参数，用于服务端保存此会活在銭状恋。未传递liveid 时，服务端会创建一个新的会话，并返回liveid
@property (strong, nonatomic) NSString *interval_sec; // 用于设定定时器间隔时间
@end

@protocol UserCallback
// 登录成功回调
-(void)onLoginSuccessWithXMUser:(XMUser*)xmUser;
// 登录失败回调
-(void)onLoginFailedWithReason:(NSString*)reason;
// 登出回调
-(void)onLogout;
// 取消登录
-(void)onLoginCancel;
@end

@protocol PCallback
// 支付成功回调
-(void)onPSuccess:(NSString*)successInfo;
// 支付失败回调
-(void)onPFailed:(NSString *)failInfo;
// 支付取消回调
-(void)onPCancel;
@end

@protocol InitCallback
// 初始化成功回调
-(void)onInitSuccess:(NSString*)successInfo;
// 初始化失败回调
-(void)onInitFailed:(NSString *)failInfo;
@end


@interface XMOrdCreateParams : NSObject
@property (nonatomic,copy) NSString *yayawanOrdId;
@property (nonatomic,copy) NSString *ordId;
@property (nonatomic,copy) NSString *godsId;
@property (nonatomic,copy) NSString *goodsName;
@property (nonatomic,copy) NSString *extInfo;
@property int price;
@end


@interface  XMExtRoleData : NSObject
@property (nonatomic,copy) NSString* roleId;
@property (nonatomic,copy) NSString* roleName;
@property int roleLevel;
@property int zoneId;
@property int type;
@property (nonatomic,copy) NSString* zoneName;
@end


@interface ConclusionProxyCommon : NSObject
@property(nonatomic, strong) XMUser* UserData;
@property(nonatomic, strong) XMOrdCreateParams* PData;
@property(nonatomic,assign)int LoginPy;
@property(nonatomic,assign)int loginPyLevel;
@property(assign)BOOL isPy;
@property(nonatomic,copy)NSString *UnionId;
@property (nonatomic, strong) void(^bindUserBlock)(XMUser *bindUser);
@property(nonatomic,copy)void(^initSucessCallBack)(BOOL isSucess);
@property(nonatomic,copy)void(^initGameID)(BOOL issuccess);

+(ConclusionProxyCommon *)instance;

-(void) ck_active;
-(void)ck_gameid;
//-(void) ck_login:(XMUser*) xMuser;
//-(NSString *)tokenFormat:(XMUser *) xMuser;
-(void) ck_pp:(XMOrdCreateParams* ) ppData;
-(XMOrdCreateParams *) getPpData;
//-(void) setUserData:(XMUser *)User;
-(void) yywUserData:(XMUser *)User;
-(XMUser *) getUserData;
-(NSString *) getUnionId;
-(NSString *) getGameId;
@end


@interface ConclusionKitManager : NSObject

typedef NS_ENUM(NSUInteger, EventRecord){
    EventRecordFinishTutorail, // 完成教程
    EventRecordInitialCheckout, // 点击查看购买界面
    EventRecordLevelAchieved, // 在游戏内达到多少等级
  // 以下事件SDK内部已记录，无需再调
    EventRecordInstall, // 安装
    EventRecordCompleteRegistration, // 完成注册
    EventRecordPurchase, // 完成购买
    EventRecordPurchaseCanceled, // 取消购买
    EventRecordFirstCharge, // 账号完成首次充值时上报
    EventRecordRepeatPurchase, // 二次充值时上报
};

@property (nonatomic,retain)  id<UserCallback> userCallback;
@property (nonatomic,retain)  id<PCallback> ppCallback;
@property (nonatomic,retain)  id<InitCallback> initCallback;

+(id)instance;
/**
 初始化SDK，设置回调代理遵守协议<InitCallback>，必须实现两个初始化回调方法，否则报错
 @param initCallback 设置初始化回调代理，协议<InitCallback>
 */
-(void)init:(id)initCallback;
//-(void)init:(id)initCallback withAppId:(NSString*)appId;
/**
 调起SDK登录，设置登录回调代理，协议<UserCallback>，必须实现协议里的回调方法，否则报错
 @param userCallback 设置登录回调代理，协议<UserCallback>
 */
-(void)login:(id)userCallback;

/**
 渠道登录
 @param channel 渠道标识
 @param userID 渠道用户id
 @param token 渠道token
 */
-(void)loginWithChannel:(NSString *)channel userID:(NSString *)userID token:(NSString *)token result:(LoginResultBlock)resultBlock;
//-(void)loginWithChannel:(NSString *)channel userID:(NSString *)userID token:(NSString *)token time:(NSString *)time sessid:(NSString *)sessid result:(LoginResultBlock)resultBlock;
/**
 角色信息上报
 @param roleId         角色ID
 @param roleName    角色名
 @param roleLevel  角色等级
 @param zoneId        服务器ID
 @param zoneName    服务器名
 @param type             上报类型，1登录，2创角，3升级
 */
-(void)setExtRoleData:(NSString*)roleId roleName:(NSString*)roleName roleLevel:(int) roleLevel zoneId:(int) zoneId zoneName:(NSString*) zoneName type:(int)type;
/**
 事件上报，EventRecordFirstCharge 账号完成首次充值时上报，EventRecordRepeatPurchase 二次充值时上报，海外版接入此方法，国内暂不接入
 @param event    事件类型
 */
-(void)reportEventName:(EventRecord)event;
/**
 登出账号
 @param userCallback 登出账号回调，协议<UserCallback>
 */
-(void)logout:(id)userCallback;
/**
 支付
 @param orId 研发订单号
 @param godsId 苹果内购的商品id
 @param godsName 商品名
 @param price 金额(单位：分)
 @param extInfo 附加信息/透传字段
 @param pCallback 支付回调，协议<PCallback>
 */
-(void)pp:(NSString*)orId godsId:(NSString*)godsId godsName:(NSString*)godsName price:(int)price extInfo:(NSString*)extInfo Delegate:(id)pCallback;
-(void)ppCreateCallback:(XMOrdCreateParams *) pData;
-(void)openUrl:(NSURL*)url;
-(void)animation;
//#if NeedRealName
-(void)realname;
//#endif

//#if ThirdLogin_Facebook
/**
 统计事件，目前海外包接入Facebook需要调用此接口
 @param eventType 事件类型
 @param value  附加参数，EventRecordLevelAchieved 事件在此传入角色等级，其它事件传0
 */
//-(void)eventRecord:(EventRecord)eventType value:(NSInteger)value;
//#endif

/**
 上报AF自定义事件，目前可传事件名如下：
 complete_tutorial  完成新手引导时计入
 complete_pvp  赛季PVP玩法战斗完成。发起赛季PVP玩法并完成战斗时计入，重复计入
 join_alliance  加入军团。首次创建或加入军团时计入
 daily_activity 每日活跃达到100时计入，重复计入
 drporsche_2000 购买0元购2000钻石档位时计入
 */
-(void)logAFEventWithName:(NSString *)eventName;

/**
 将数数访客ID设置到AppsFlyer上去
 */
-(void)setAFCustomerUserID:(NSString *)uid;

//#if SDK_AdMob
/**
 弹出谷歌视频广告页面
 @param adid  广告单元id
 */
-(void)showGoogleAd:(NSString *)adid callback:(BoolBlock)callbackBlock;
//#endif

/**
 弹TopOn广告
 @param type 广告类型，0激励视频，1插屏，2横幅，3原生
 @param callbackBlock 广告展示结果，YES 展示成功且播放完毕，NO 展示失败或提前关闭广告
 */
-(void)showTopOnAdType:(NSInteger)type callback:(BoolBlock)callbackBlock;

/**
 获取广告数据
 */
-(void)loadTopOnAdSuccess:(ArrayBlock)callbackBlock;
/**
 弹广告加载失败提示
 */
-(void)loadTopOnAdFaildTips;

//#if SDK_Naver
/**
 弹出Naver社区大厅公告栏
 */
-(void)showNaverHall;
//#endif

/**
 获取Facebook登录用户信息，name名称，avatarUrl头像链接，需要先登录FB
 */
- (void)facebookUserInfo:(void(^)(NSString *name, NSString *avatarUrl))resultBlock;
/**
 Facebook分享
 @param content 分享文本内容
 @param resultBlock 分享结果回调
 */
- (void)facebookShareWithContent:(NSString *)content result:(BoolBlock)resultBlock;
/**
 显示浮标页，能看到账号绑定信息
 */
- (void)showFloatPage;
/**
 设置绑定Facebook登录成功回调，取消绑定和绑定失败不会回调
 */
- (void)setBindFacebookSuccessCallback:(VBlock)result;

/**
 绑定三方登录
 @param type  applelogin苹果登录，fblogin Facebook登录，twitterlogin Twitter登录，vklogin VK登录
 */
//- (void)bindChannelLoginWithType:(NSString *)type result:(BoolBlock)result;

/**
 获取用户绑定三方平台登录信息，请在登录成功后调用
 */
//- (void)userBindInfo;

/**
 提交游戏内聊天记录接口(国内)
 @param msg 聊天消息内容
 @param type 消息类型: PRIVATE 私聊，NEAR 附近，GLOBAL 世界，TEAM 队伍，GUILD 公会，MAP 地图，GUILDMAIL 公会邮件，OTHER 其他
 */
- (void)uploadChatMsg:(NSString *)msg type:(NSString *)type;

/**
 分享图片到三方平台(国内)或保存本地相册
 @param image 游戏截图或其他图片
 @param type 平台类型，0微信好友和朋友圈，1QQ好友，2新浪微博，3保存到相册
 */
- (void)shareImage:(UIImage *)image type:(NSInteger)type;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

- (BOOL)application:(UIApplication *_Nullable)application continueUserActivity:(NSUserActivity *_Nullable)userActivity restorationHandler:(void (^_Nullable)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler;

- (void)application:(UIApplication *_Nullable)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *_Nonnull)deviceToken;

@end

#endif

