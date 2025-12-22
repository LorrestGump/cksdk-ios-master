//
//  VKIDManager.m
//  VKID
//
//  Created by 1234 on 2024/3/28.
//

#import "VKIDManager.h"

//#import "CKSDKProj-Swift.h"
//#import "ConclusionKit/ConclusionKit-Swift.h"
#import "VKIntegration/VKIntegration-Swift.h"

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

-(void)ConFigWithClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret{
    self.bridge = [VKIDBridge new];
    [self.bridge configWithClientId:clientID clientSecret:clientSecret];
}

- (void)Authorize:(void (^)(NSString *,NSString *))result{
//    [self.bridge authorizeWithComplete:^(NSInteger userId) {
//        
//    }];
    
    [self.bridge authorizeWithComplete:^(NSInteger userId, NSString *token) {
        if(result){
            result([NSString stringWithFormat:@"%ld",(long)userId],token);
        }
    }];
}

- (BOOL)openURL:(NSURL *)url{
    return [self.bridge openWithUrl:url];
}
@end
