//
//  CKSDKProtocalKit.m
//  CKSDKProtocalKit
//
//  Created by LorrestGump on 2025/12/5.
//

#import <Foundation/Foundation.h>
#import "CKSDKProtocalKit.h"

CKSDKEvent const CKSDKEventAppOpen            = @"app_open";
CKSDKEvent const CKSDKEventFirstOpen          = @"first_open";
CKSDKEvent const CKSDKEventLogin              = @"login";
CKSDKEvent const CKSDKEventRegistration       = @"registration";
CKSDKEvent const CKSDKEventCreateRole         = @"create_role";
CKSDKEvent const CKSDKEventPay                = @"pay";
CKSDKEvent const CKSDKEventFirstPurchase      = @"first_charge";
CKSDKEvent const CKSDKEventSecondPurchase     = @"repeat_purchase";
CKSDKEvent const CKSDKEventLevelUp            = @"levelup";
CKSDKEvent const CKSDKEventShowAds            = @"openads";
CKSDKEvent const CKSDKEventCompleteTutorial   = @"complete_tutorial";
CKSDKEvent const CKSDKEventCompletePVP        = @"complete_pvp";
CKSDKEvent const CKSDKEventJoinAlliance       = @"join_alliance";
CKSDKEvent const CKSDKEventDailyActivity      = @"daily_activity";
CKSDKEvent const CKSDKEventDrporsche2000      = @"drporsche_2000";
CKSDKEvent const CKSDKEventInitCheckout       = @"init_checkout";


// In app event names constants
//#define CKSDKEvent_AppOpen          @"app_open" // 打开应用时上报，每次打开应用都需要上报
//#define CKSDKEvent_FirstOpen        @"first_open" // 首次启动
//#define CKSDKEvent_Login            @"login" // 登录
//#define CKSDKEvent_Registration     @"registration" // 注册
//#define CKSDKEvent_CreateRole       @"create_role" // 创建角色
//#define CKSDKEvent_Pay              @"pay" // 完成支付时上报，每次付费完成行为和金额，包括档位充值和其他所有付费，金额保留小数点后两位
//#define CKSDKEvent_FirstPurchase    @"first_charge" // 首充
//#define CKSDKEvent_SecondPurchase   @"repeat_purchase" // 二充
//#define CKSDKEvent_LevelUp          @"levelup" // 角色升级
//#define CKSDKEvent_ShowAds          @"openads" // 看广告
//#define CKSDKEvent_CompleteTutorial @"complete_tutorial" // 完成新手引导教程时计入
//#define CKSDKEvent_CompletePVP      @"complete_pvp" // 赛季PVP玩法战斗完成。发起赛季PVP玩法并完成战斗时计入，重复计入
//#define CKSDKEvent_JoinAlliance     @"join_alliance" // 加入军团。首次创建或加入军团时计入
//#define CKSDKEvent_DailyActivity    @"daily_activity" // 每日活跃达到100时计入，重复计入
//#define CKSDKEvent_Drporsche2000    @"drporsche_2000" // 购买0元购2000钻石档位时计入
//#define CKSDKEvent_InitCheckout     @"init_checkout" // 点击查看购买界面
