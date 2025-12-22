//
//  NaverIntegration.m
//  NaverIntegration
//
//  Created by LorrestGump on 2025/12/6.
//

#import "NaverIntegration.h"
#import <NNGSDK/NNGSDKManager.h>

@interface NaverIntegration ()<NNGSDKDelegate>

@end

@implementation NaverIntegration

+ (instancetype)shared{
    static  NaverIntegration*  navext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (nil == navext) {
            navext = [[NaverIntegration alloc] init];
        }
    });
    return navext;
}

- (void)setUp{
    [NNGSDKManager.shared setClientId:InfoPlist(@"NaverClientID")
                         clientSecret:InfoPlist(@"NaverClientSecret")
                             loungeId:InfoPlist(@"NaverLoungeID")];
    [NNGSDKManager.shared setParentViewController:kKeyWindow.rootViewController];
    NNGSDKManager.shared.appScheme = InfoPlist(@"NaverScheme");
    NNGSDKManager.shared.delegate = self;
}

- (void)showView{
    // liting000@naver.com  LITINGFANYI1
    [NNGSDKManager.shared setParentViewController:kKeyWindow.rootViewController];
//    [NNGSDKManager.shared presentBoardViewControllerWith:nil];
    [NNGSDKManager.shared presentBannerViewController];
}

/**
 * The delegate method called when SDK starts.
 */
- (void)nngSDKDidLoad{
    NSLog(@"nngSDKDidLoad");
}

/**
 * The delegate method called when SDK ends.
 */
- (void)nngSDKDidUnload{
    NSLog(@"nngSDKDidUnload");
}

/**
 * The delegate method called when a predefined in-game board code is received.
 */
- (void)nngSDKDidReceiveInGameMenuCode:(NSString *)inGameMenuCode{
    NSLog(@"inGameMenuCode %@",inGameMenuCode);
}

@end
