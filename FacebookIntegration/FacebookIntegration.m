//
//  FacebookIntegration.m
//  FacebookIntegration
//
//  Created by LorrestGump on 2025/12/4.
//

#import "FacebookIntegration.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface FacebookIntegration ()<FBSDKSharingDelegate,ThirdLibDelegate>

@end

@implementation FacebookIntegration

+ (instancetype)shared{
    static  FacebookIntegration*  facebext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == facebext) {
            facebext = [[FacebookIntegration alloc] init];
        }
    });
    return facebext;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    return [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    //fb3602587300000833://authorize#denied_scopes=&granted_scopes=email%2Copenid%2Cgaming_profile&graph_domain=gaming&nonce=AWVi...A4MjE0fQ&state=%7B%22challenge%22%3A%22X15WACrnTTWmLo1FzioU3ysVWWc%253D%22%2C%223_method%22%3A%22sfvc_auth%22%2C%220_auth_logger_id%22%3A%22CAD5B28C-4740-4A2A-8C29-B43A97DB000C%22%2C%22com.facebook.sdk_client_state%22%3Atrue%7D
    return [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url options:options];
}

- (void)loginSuccess:(DictBlock)sBlock failure:(VBlock)fBlock{

    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithPermissions:@[@"public_profile", @"email"] fromViewController:kKeyWindow.rootViewController handler:^(FBSDKLoginManagerLoginResult * _Nullable result, NSError * _Nullable error) {
        //用户的facebookId 传给后台 判断该用户是否绑定手机号，如果绑定了直接登录，如果没绑定跳绑定手机号页面
        if (error) {
            NSLog(@"Process error");
            if (fBlock)fBlock();
        }else if (result.isCancelled){
            NSLog(@"Cancelled");
            if (fBlock)fBlock();
        }else{
            NSString *facebookId = result.token.userID;
            if(sBlock && facebookId.length>0){
                NSDictionary *data = @{kParamUid:facebookId, kParamToken:result.token.tokenString};
                sBlock(data);
            }
        }
    }];
}

- (void)userInfoWithUserId:(NSString *)userId params:(NSDictionary *)params success:(DictBlock)sBlock failure:(VBlock)fBlock{
    //    NSDictionary*params= @{@"fields":@"id,name,email,age_range,first_name,last_name,link,gender,locale,picture,timezone,updated_time,verified"};
//        NSString *facebookID = GetOK(kFacebookUID);
//        if (facebookID.length == 0) {
//            return;
//        }
//        NSDictionary*params= @{@"fields":@"id,name,email,picture"};
    if (userId.length == 0) {
        if (fBlock) fBlock();
        return;
    }
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:userId
                                      parameters:params
                                      HTTPMethod:@"GET"];
    [request startWithCompletion:^(id<FBSDKGraphRequestConnecting>  _Nullable connection, id  _Nullable result, NSError * _Nullable error) {
//        NSLog(@"%@",result);
        NSString *email = result[@"email"];
        NSString *userId = result[@"id"];
        NSString *avatar_url = result[@"picture"][@"data"][@"url"];
        NSString *username = result[@"name"];
        if (avatar_url.length == 0) {
            if (fBlock) fBlock();
            return;
        }
        
        if (sBlock) {
            NSDictionary *data = @{kParamEmail:CheckNil(email),kParamUid:CheckNil(userId),kParamAvatarUrl:CheckNil(avatar_url),kParamUName:CheckNil(username)};
            sBlock(data);
        }
    }];
}

- (void)shareWithContent:(NSString *)content result:(BoolBlock)resultBlock{
    self.fbShareResultBlock = resultBlock;
    FBSDKShareLinkContent *linkContent = [FBSDKShareLinkContent new];
    linkContent.quote = content;
    linkContent.contentURL = [NSURL URLWithString:[@"https://itunes.apple.com/app/id" stringByAppendingString:InfoPlist(@"AppleID")]]; //商店页
    // https://pirategoinvite.onelink.me/gYMZ/6qmatd6e
//    linkContent.contentURL = [NSURL URLWithString:@"https://pirategoinvite.onelink.me/gYMZ/6qmatd6e"];
    FBSDKShareDialog *dialog = [FBSDKShareDialog dialogWithViewController:kKeyWindow.rootViewController withContent:linkContent delegate:self];
    [dialog show];
}

/// Sent to the delegate when sharing completes without error or cancellation.
/// @param sharer The sharer that completed.
/// @param results The results from the sharer.  This may be nil or empty.
- (void)sharer:(id <FBSDKSharing> _Nonnull)sharer didCompleteWithResults:(NSDictionary<NSString *, id> * _Nonnull)results{
    NSLog(@"Facebook分享成功");
    if (self.fbShareResultBlock) {
        self.fbShareResultBlock(YES);
    }
}
/// Sent to the delegate when the sharer encounters an error.
/// @param sharer The sharer that completed.
/// @param error The error.
- (void)sharer:(id <FBSDKSharing> _Nonnull)sharer didFailWithError:(NSError * _Nonnull)error{
    NSLog(@"Facebook分享失败：%@",error);
    if (self.fbShareResultBlock) {
        self.fbShareResultBlock(NO);
    }
}
/// Sent to the delegate when the sharer is cancelled.
/// @param sharer The sharer that completed.
- (void)sharerDidCancel:(id <FBSDKSharing> _Nonnull)sharer{
    NSLog(@"取消Facebook分享");
    if (self.fbShareResultBlock) {
        self.fbShareResultBlock(NO);
    }
}

- (void)logEventWithName:(NSString *)eventName parameters:(NSDictionary<NSString *,id> *)parameters{
//    switch (eventType) {
//      case EventRecordFinishTutorail: // 完成教程
//        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNameCompletedTutorial];
//        break;
//      case EventRecordInitialCheckout: // 点击查看购买界面
//        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNameInitiatedCheckout];
//        break;
//      case EventRecordLevelAchieved: // 在游戏内达到多少等级
//        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNameAchievedLevel parameters:@{FBSDKAppEventNameAchievedLevel : @(value)}];
//        break;
//      case EventRecordInstall: // 安装
//        break;
//      case EventRecordCompleteRegistration: // 完成注册
//        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNameCompletedRegistration];
//        break;
//      case EventRecordPurchase: // 完成购买
//  //      [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNamePurchased];
//        break;
//      case EventRecordPurchaseCanceled: // 取消支付
//        [[FBSDKAppEvents shared] logEvent:@"fb_mobile_purchase_canceled"];
//        break;
//      default:
//        break;
//    }
    
    if ([eventName isEqualToString:CKSDKEventCompleteTutorial]) {
        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNameCompletedTutorial];
    }else if ([eventName isEqualToString:CKSDKEventInitCheckout]){
        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNameInitiatedCheckout];
    }else if ([eventName isEqualToString:CKSDKEventLevelUp]){
        NSNumber *level = parameters[kParamLevel];
        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNameAchievedLevel parameters:@{FBSDKAppEventNameAchievedLevel : level}];
    }else if ([eventName isEqualToString:CKSDKEventRegistration]){
        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNameCompletedRegistration];
    }else if ([eventName isEqualToString:CKSDKEventPay]){
        [[FBSDKAppEvents shared] logEvent:FBSDKAppEventNamePurchased];
    }else{
        return;
    }
}

@end
