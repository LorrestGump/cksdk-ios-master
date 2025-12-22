//
//  TwitterIntegration.h
//  TwitterIntegration
//
//  Created by LorrestGump on 2025/12/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CKSDKProtocalKit/CKSDKProtocalKit.h>

NS_ASSUME_NONNULL_BEGIN

#define TwTInt [TwitterIntegration shared]

@interface TwitterIntegration : NSObject <ThirdLibDelegate>

+ (instancetype)shared;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

/**
 初始化 `Twitter`
 
 请在Info.plist设置初始化参数 TwitterAPIKey 和 TwitterSecret。
 */
- (void)setUp;

/**
 `Twitter` 登录
 @param sBlock 登录成功回调
 @param fBlock 登录失败回调
 */
- (void)loginSuccess:(DictBlock)sBlock failure:(VBlock)fBlock;



@end

NS_ASSUME_NONNULL_END
