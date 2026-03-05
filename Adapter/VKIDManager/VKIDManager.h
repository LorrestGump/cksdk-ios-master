//
//  VKIDManager.h
//  VKID
//
//  Created by 1234 on 2024/3/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define kParamUid       @"uid"
#define kParamToken     @"token"

typedef void(^VBlock)(void);
typedef void(^DictBlock)(NSDictionary *data);

@interface VKIDManager : NSObject

+(instancetype)sharedInstance;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

/**
 `VK` 初始化
 
 请在Info.plist设置初始化参数 VKAPPID 和 VKSecret。
 */
- (void)setUp;

/**
 `VK` 登录
 @param sBlock 登录成功回调
 @param fBlock 登录失败回调
 */
- (void)loginSuccess:(DictBlock)sBlock failure:(VBlock)fBlock;

@end
