//
//  AppDelegate.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "AppDelegate.h"
#import "ZL_MapConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 初始化方法
    [self initializeWithApplication:application];
    
    __weak typeof(self) weakSelf = self;
    [[NetworkUnit sharedInstance] addObserverReachabilityChanged:^(NetworkStatus netStatus) {
        weakSelf.currentNetworkStatus = netStatus;
        weakSelf.requestTimeoutInterval = [[NetworkUnit sharedInstance] delayTime:netStatus];
        
        if (netStatus == 0) {
            [MBProgressHUD showAutoMessage:@"啊哈 没有网络哦"];
        }
        
    }];
    
    //键盘统一收回处理
    [self configureBoardManager];
    
    //加载页面
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self togoTabBarViewController];
    
    //引导页面加载
    [self setupIntroductoryPage];
    
    //启动广告（记得放最后，才可以盖在页面上面）
//    [self setupAdveriseView];
    
    [[ZL_MapConfig configMap] setMapTypeWith:Baidu];
    
    return YES;
}

#pragma mark --FUNC
#pragma mark 键盘收回管理
-(void)configureBoardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField=60;
    manager.enableAutoToolbar = NO;
}

//登录页面
-(void)togoLoginViewController
{
    LoginViewController *logInVc = [[LoginViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:logInVc];
    self.window.rootViewController = navi;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

//首页
-(void)togoTabBarViewController
{
    _tabBarController = [[ZLBaseTabBarController alloc] init];
    [self.window setRootViewController:_tabBarController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

#pragma mark 引导页
-(void)setupIntroductoryPage{
    
    //需要保存是否是第一次打开App,第一次则有引导页，否则 reture;
    if(![USERDEFAULT boolForKey:UserDefault_FirstLaunch_Key]){//第一次启动取的值一定是0，然后置1
        [USERDEFAULT setBool:YES forKey:UserDefault_FirstLaunch_Key];
        NSLog(@"第一次启动");
    
        NSArray *images=@[@"introductoryPage1",@"introductoryPage2",@"introductoryPage3",@"introductoryPage4"];
        [IntroductoryPagesHelper showIntroductoryPageView:images];
        
    }else{
        NSLog(@"不是第一次启动");
    }
    
}

#pragma mark 启动广告
-(void)setupAdveriseView
{
    // TODO 请求广告接口 获取广告图片
    
    //现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiserView:imageArray];
}

#pragma mark -- 跳转到指定页面
- (void)togoTabBarItem:(NSInteger)index{

    [_tabBarController gotoSelectedTabBarItem:index];
    
}

@end
