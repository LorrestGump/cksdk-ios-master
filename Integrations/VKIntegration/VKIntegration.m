//
//  VKIntegration.m
//  VKIntegration
//
//  Created by LorrestGump on 2025/12/5.
//

#import "VKIntegration.h"
#import "VKIDManager.h"



@implementation VKIntegration

+ (instancetype)shared{
    static  VKIntegration*  vkext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == vkext) {
            vkext = [[VKIntegration alloc] init];
        }
    });
    return vkext;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return [[VKIDManager sharedInstance] openURL:url];
}

- (void)setUp{
    [[VKIDManager sharedInstance] ConFigWithClientID:InfoPlist(@"VKAPPID") clientSecret:InfoPlist(@"VKSecret")];
}

-(void)loginSuccess:(DictBlock)sBlock failure:(VBlock)fBlock{
    
    [[VKIDManager sharedInstance] Authorize:^(NSString *userId, NSString *token) {
        if(sBlock && userId.length>0){
            NSDictionary *data = @{kParamUid:userId,kParamToken:token};
            sBlock(data);
        }else{
            if (fBlock) fBlock();
        }
    }];
}

@end
