//
//  VKIDManager.m
//  VKID
//
//  Created by 1234 on 2024/3/28.
//

#import "VKIDManager.h"

//#import <VKIntegration/VKIntegration-Swift.h>

//#import <VKIDBridge/VKIDBridge-Swift.h>
//#import <VKID/VKID-Swift.h>
#import <VKIDManager/VKIDManager-Swift.h>

#define InfoPlist(x) [NSBundle mainBundle].infoDictionary[x]

@interface VKIDManager()
@property (strong, nonatomic) VKIDBridge *bridge;
@end

@implementation VKIDManager

+ (instancetype)sharedInstance{
    static  VKIDManager*  s_instance = nil;
    if (nil == s_instance) {
        @synchronized(self) {
            if (nil == s_instance) {
                s_instance = [[self alloc] init];
            }
        }
    }
    return s_instance;
}

- (void)Authorize:(void (^)(NSString *,NSString *))result{
    [self.bridge authorizeWithComplete:^(NSInteger userId, NSString *token) {
        if(result){
            result([NSString stringWithFormat:@"%ld",(long)userId],token);
        }
    }];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return [self.bridge openWithUrl:url];
}

- (void)setUp{
    self.bridge = [VKIDBridge shared];
    [self.bridge configWithClientId:InfoPlist(@"VKAPPID") clientSecret:InfoPlist(@"VKSecret")];
}

-(void)loginSuccess:(DictBlock)sBlock failure:(VBlock)fBlock{
    
    [self Authorize:^(NSString *userId, NSString *token) {
        if(sBlock && userId.length>0){
            NSDictionary *data = @{kParamUid:userId,kParamToken:token};
            sBlock(data);
        }else{
            if (fBlock) fBlock();
        }
    }];
}
@end
