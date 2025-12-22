//
//  VKIDManager.h
//  VKID
//
//  Created by 1234 on 2024/3/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VKIDManager : NSObject

+(instancetype)sharedInstance;

-(void)ConFigWithClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret;

-(void)Authorize:(void (^)(NSString *userID, NSString *token))result;

-(BOOL)openURL:(NSURL *)url;
@end

