//
//  TwitterIntegration.m
//  TwitterIntegration
//
//  Created by LorrestGump on 2025/12/5.
//

#import "TwitterIntegration.h"

#import <TwitterKit/TWTRKit.h>

@implementation TwitterIntegration

+ (instancetype)shared{
    static  TwitterIntegration*  twtext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == twtext) {
            twtext = [[TwitterIntegration alloc] init];
        }
    });
    return twtext;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    //twitterkit-TgETMUoPDuaHMU6sjGuPkDtXV://secret=NPUntgDThlR03srXRnEe3weGe2QmPSEcMtpA9tJ2ZDKXP&token=1670701125430030337-4ZBxurkHndxyoPfVQ2HpBatmTn6iEo&username=NaLi_Pixel
    return [[Twitter sharedInstance] application:application openURL:url options:options];
}

- (void)setUp{
    [[Twitter sharedInstance] startWithConsumerKey:InfoPlist(@"TwitterAPIKey") consumerSecret:InfoPlist(@"TwitterSecret")];
}

- (void)loginSuccess:(DictBlock)sBlock failure:(VBlock)fBlock{
    [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if (session) {
            NSLog(@"userName  = %@", [session userName]);
            NSLog(@"userID  = %@", [session userID]);
            NSLog(@"authToken  = %@", [session authToken]);
            NSLog(@"authTokenSecret  = %@", [session authTokenSecret]);
            NSString *userId = [session userID];
            NSString *userName = [session userName];
            NSString *authToken = [session authToken];
            NSString *authTokenSecret = [session authTokenSecret];
            if(sBlock && userId.length>0){
                NSDictionary *data = @{
                    kParamUName:CheckNil(userName),
                    kParamUid:CheckNil(userId),
                    kParamToken:CheckNil(authToken),
                    kParamTokenSecret:CheckNil(authTokenSecret),
                };
                sBlock(data);
            }
        } else {
            NSLog(@"Twitter Login Failed: %@",error);
            if (fBlock)fBlock();
        }
    }];
}

@end
