//
//  ViewController.m
//  SDKDemo
//
//  Created by LorrestGump on 2025/12/1.
//

#import "ViewController.h"
#import <CKSDKCore/ConclusionKit.h>


// 三方扩展功能接入设置，1接入，0不接入。未接入可在此关闭相关代码避免编译报错
#define Facebook    1  // Facebook分享和绑定
#define AdMob       1  // 谷歌广告
#define AppLovin    0  // AppLovin广告
#define Naver       1  // Naver社区页
//#define TopOn       0  // TopOn广告
#define ShareImg    1  // 图片分享，QQ/微信/微博
// 其他
#define UpLoadChat  1  // 上传聊天记录


@interface CustomButton : UIButton
@end
@implementation CustomButton
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 6;
        [self setBackgroundColor:[UIColor systemOrangeColor]];
        [self setTitleColor :[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}
@end

@interface ViewController ()

@property (strong, nonatomic) CustomButton *loginBtn;
@property (strong, nonatomic) CustomButton *payBtn;
@property (strong, nonatomic) CustomButton *roleBtn;
@property (strong, nonatomic) CustomButton *logoutBtn;

@property (strong, nonatomic) CustomButton *showFloatPageBtn;
@property (strong, nonatomic) CustomButton *showAdBtn;
@property (strong, nonatomic) CustomButton *showNaverBtn;
@property (strong, nonatomic) CustomButton *bindAppleLoginBtn;
@property (strong, nonatomic) CustomButton *channelLoginBindCallbackSetBtn;
@property (strong, nonatomic) CustomButton *facebookInfo;
@property (strong, nonatomic) CustomButton *facebookShareBtn;
@property (strong, nonatomic) CustomButton *showTopOnAdBtn;
@property (strong, nonatomic) CustomButton *uploadChatBtn;
@property (strong, nonatomic) CustomButton *shareImageBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
   [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // CKSDK初始化，请在Info.plist设置CKAppID
    [CKSDK initSuccess:^{
        NSLog(@"初始化成功");
    } failure:^{
        NSLog(@"初始化失败");
    }];
    // SDK设置登录结果回调
    [CKSDK setLoginSuccess:^(XMUser *user) {
        NSLog(@"User Info:%@",user);
    } failure:^{
        NSLog(@"登录失败");
    }];
    // SDK设置登出回调
    CKSDK.logoutBlock = ^{
        NSLog(@"退出登录");
        [CKSDK showLoginView];
    };
    
    
    [self setUpUI];
}

-(void)loginBtnclick{
    NSLog(@"点击登录按钮");
    // 弹出SDK登录框
    [CKSDK showLoginView];
    
    // 渠道登录，除非特殊说明，请勿调用此登录
//    [CKSDK loginWithChannel:@"hwygame" userID:@"" token:@"" result:^(BOOL result, NSDictionary *userdata) {
//        if (result) {
//            NSLog(@"登录成功");
//            NSString *ck_uid = [userdata objectForKey:@"uid"];
//            NSString *ck_username = [userdata objectForKey:@"username"];
//            NSString *ck_token = [userdata objectForKey:@"token"];
//        }
//    }];
}

-(void)logoutBtnClick{
    NSLog(@"点击登出按钮");
    [CKSDK logout];
}

-(void)payBtnclick{
    NSLog(@"点击支付按钮");
    int value = (arc4random() % 100000) + 10000000;
    NSString *orderId = @(value).stringValue;
    NSString *goodsName = @"1元商品";
    NSString *goodsId = @"pirategonew.ios.99";
    CGFloat price = 99;
    
    [CKSDK pp:orderId
       godsId:goodsId
     godsName:goodsName
        price:price
      extInfo:@"extInfo"
      success:^(NSString *string) {
        NSLog(@"支付成功");
    } failure:^(NSString *string) {
        NSLog(@"支付失败");
    } cancel:^{
        NSLog(@"支付取消");
    }];
}

-(void)roleBtnclick{
    NSLog(@"点击角色信息上报按钮");
    // 上传类型，（类型分别为 1，2，3）,填入 1为角色登陆成功  2为角色创建  3为角色升级
    [CKSDK setExtRoleData:@"122324" roleName:@"天下" roleLevel:15 zoneId:99999 zoneName:@"天下" type:2];
}


#pragma mark - 以下为三方扩展内容，选接。具体请查看SDK参数文档说明是否接入

#if Naver
- (void)showNaverBtnClick{
    NSLog(@"弹出Naver社区页");
    [TMD showNaverHall];
}
#endif


-(void)showAdBtnClick{
#if AdMob
    NSLog(@"弹出谷歌广告视频");
    [TMD showGoogleAd:@"ca-app-pub-4372624079541069/8759581368" callback:^(BOOL value) {
        if(value){
            NSLog(@"广告已展示");
        }else{
            NSLog(@"广告加载失败，请稍后再试");
        }
    }];
#endif
#if AppLovin
    NSLog(@"弹出AppLovin广告视频");
    [TMD showAppLovinAd:@"004155407d45e527" callback:^(BOOL value) {
        if(value){
            NSLog(@"广告已展示");
        }else{
            NSLog(@"广告加载失败，请稍后再试");
        }
    }];
#endif
}


#if Facebook
- (void)showFloatPageBtnClick{
    NSLog(@"弹出浮标页");
    [CKSDK showFloatPage];
}

- (void)channelLoginBindCallbackSetBtnClick{
    // 非必接，设置Facebook绑定登录回调
    [TMD setBindFacebookSuccessCallback:^{
        NSLog(@"Facebook登录绑定成功");
    }];
}

- (void)facebookInfoBtnClick{
    NSLog(@"点击获取Facebook用户信息按钮");
    // 非必接
    [TMD facebookUserInfo:^(NSString *name, NSString *avatarUrl) {
        NSLog(@"Facebook用户名称：%@\n头像链接：%@",name,avatarUrl);
    }];
}

- (void)facebookShareBtnClick{
    NSLog(@"点击Facebook分享按钮");
    // 非必接
    [TMD facebookShareWithContent:@"Hello!" result:^(BOOL value) {
        if (value) {
            NSLog(@"Facebook分享成功");
        }else{
            NSLog(@"Facebook分享失败");
        }
    }];
}
#endif

#if TopOn
- (void)showTopOnAdBtnClick{
    NSLog(@"弹出TopOn广告");
    // type 广告类型，0激励视频，1插屏，2横幅，3原生
    [TMD showTopOnAdType:1 callback:^(BOOL value) {
        if (value) { // 视频已展示且播放完成，插屏或横幅已展示
            NSLog(@"广告已展示");
        }else{ // 广告加载失败或提前关闭
            NSLog(@"广告加载失败，请稍后再试");
        }
    }];
}
#endif

#if UpLoadChat
- (void)uploadChatBtnClick{
    NSLog(@"上传聊天信息");
    // 非必接
    // type 消息类型: PRIVATE 私聊，NEAR 附近，GLOBAL 世界，TEAM 队伍，GUILD 公会，MAP 地图，GUILDMAIL 公会邮件，OTHER 其他
    [CKSDK uploadChatMsg:@"Hello" type:@"PRIVATE"];
}
#endif

#if ShareImg
- (void)shareImageBtnClick{
    NSLog(@"点击图片分享");
    // 非必接，上架国内游戏可能会用到
    // type 平台类型，0微信好友和朋友圈，1QQ好友，2新浪微博，3保存到相册
    [TMD shareImage:[UIImage imageNamed:@"testImg.jpg"] type:2];
}
#endif




-(void)setUpUI{
    self.view.backgroundColor = [UIColor lightGrayColor];
    CGFloat btnWidth = 240;
    CGFloat btnHeight = 40;
    CGFloat x = (self.view.frame.size.width - btnWidth)/2;
    CGFloat pad = 10;
    
    _loginBtn =  [[CustomButton alloc]initWithFrame:CGRectMake(x, 100, btnWidth, btnHeight)];
    [_loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    _roleBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + btnHeight + pad, btnWidth, btnHeight)];
    [_roleBtn setTitle:@"角色信息上报" forState:UIControlStateNormal];
    [_roleBtn addTarget:self action:@selector(roleBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_roleBtn];
    
    _payBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*2, btnWidth, btnHeight)];
    [_payBtn setTitle:@"支 付" forState:UIControlStateNormal];
    [_payBtn addTarget:self action:@selector(payBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_payBtn];

    _logoutBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*3, btnWidth, btnHeight)];
    [_logoutBtn setTitle:@"登 出" forState:UIControlStateNormal];
    [_logoutBtn addTarget:self action:@selector(logoutBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_logoutBtn];
    
    // 三方扩展功能，选接。请查看SDK参数文档是否接入
#if GoogleAD
    _showAdBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*5, btnWidth, btnHeight)];
    [_showAdBtn setTitle:@"弹出广告视频" forState:UIControlStateNormal];
    [_showAdBtn addTarget:self action:@selector(showAdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_showAdBtn];
#endif
    
#if FacebookShareAndBind
    _showFloatPageBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*4, btnWidth, btnHeight)];
    [_showFloatPageBtn setTitle:@"弹出浮标页" forState:UIControlStateNormal];
    [_showFloatPageBtn addTarget:self action:@selector(showFloatPageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_showFloatPageBtn];
    
    _channelLoginBindCallbackSetBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*6, btnWidth, btnHeight)];
    [_channelLoginBindCallbackSetBtn setTitle:@"设置绑定Facebook登录回调" forState:UIControlStateNormal];
    [_channelLoginBindCallbackSetBtn addTarget:self action:@selector(channelLoginBindCallbackSetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_channelLoginBindCallbackSetBtn];
    
    _facebookInfo = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*7, btnWidth, btnHeight)];
    [_facebookInfo setTitle:@"获取Facebook用户信息" forState:UIControlStateNormal];
    [_facebookInfo addTarget:self action:@selector(facebookInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_facebookInfo];
    
    _facebookShareBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*8, btnWidth, btnHeight)];
    [_facebookShareBtn setTitle:@"Facebook分享" forState:UIControlStateNormal];
    [_facebookShareBtn addTarget:self action:@selector(facebookShareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_facebookShareBtn];
#endif
    
#if Naver
    _showNaverBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*9, btnWidth, btnHeight)];
    [_showNaverBtn setTitle:@"弹出Naver社区页" forState:UIControlStateNormal];
    [_showNaverBtn addTarget:self action:@selector(showNaverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_showNaverBtn];
#endif
    
#if TopOn
    _showTopOnAdBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*10, btnWidth, btnHeight)];
    [_showTopOnAdBtn setTitle:@"弹出TopOn广告" forState:UIControlStateNormal];
    [_showTopOnAdBtn addTarget:self action:@selector(showTopOnAdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_showTopOnAdBtn];
#endif
    
#if UpLoadChat
    _uploadChatBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*11, btnWidth, btnHeight)];
    [_uploadChatBtn setTitle:@"上传聊天信息" forState:UIControlStateNormal];
    [_uploadChatBtn addTarget:self action:@selector(uploadChatBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_uploadChatBtn];
#endif
    
#if ShareImg
    _shareImageBtn = [[CustomButton alloc]initWithFrame:CGRectMake(x, _loginBtn.frame.origin.y + (btnHeight + pad)*12, btnWidth, btnHeight)];
    [_shareImageBtn setTitle:@"分享图片到QQ微信微博" forState:UIControlStateNormal];
    [_shareImageBtn addTarget:self action:@selector(shareImageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shareImageBtn];
#endif
}
@end
