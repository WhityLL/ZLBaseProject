//
//  BaseViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    CGFloat navigationY;
    CGFloat navBarY;
    CGFloat verticalY;
    BOOL _isShowMenu;
}
@property CGFloat original_height;

@property (nonatomic,weak) Reachability *hostReach;

@end

@implementation BaseViewController

-(id)init
{
    if (self == [super init]) {
        [self.navigationController.navigationBar setTranslucent:NO];
        [self.navigationController setNavigationBarHidden:YES];
        navBarY = 0;
        navigationY = 0;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    if ([self respondsToSelector:@selector(set_NaviBackgroundColor)]) {
        UIColor *backgroundColor =  [self set_NaviBackgroundColor];
        UIImage *bgimage = [UIImage imageWithColor:backgroundColor];
        [self.navigationController.navigationBar setBackgroundImage:bgimage forBarMetrics:UIBarMetricsDefault];
    }
    
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //默认显示黑线
    blackLineImageView.hidden = NO;
    if ([self respondsToSelector:@selector(hideNavigationBottomLine)]) {
        if ([self hideNavigationBottomLine]) {
            //隐藏黑线
            blackLineImageView.hidden = YES;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.extendedLayoutIncludesOpaqueBars=YES;
//    [self.navigationController.navigationBar setTranslucent:NO];
//    [self.navigationController setNavigationBarHidden:NO];
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
    
    if ([self respondsToSelector:@selector(set_navigationHeight)]) {
        CGFloat height = [self set_navigationHeight];
        [self changeNavigationBarHeight:height];
    }
    
    if (![self leftButton]) {
        [self configLeftBaritemWithImage];
    }
    
    if (![self rightButton]) {
        [self configRightBaritemWithImage];
    }
    
    [self addSubviews];
    [self bindViewModel];
    [self layoutNavigation];
    [self getNewData];
    
//    //监听网络变化
//    Reachability *reach = [Reachability reachabilityWithHostName:kURL_Reachability__Address];
//    self.hostReach = reach;
//    [[NSNotificationCenter defaultCenter]addObserver:self  selector:@selector(netStatusChange:) name:kReachabilityChangedNotification object:nil];
//    //实现监听
//    [reach startNotifier];
    
    
    
}

//找查到Nav底部的黑线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)set_hideNavigationBottomLine:(BOOL)isHide{
    
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    if (isHide) {
        blackLineImageView.hidden = YES;
    }else{
        blackLineImageView.hidden = NO;
    }
}

#pragma mark -- 改变导航栏高度
-(void)changeNavigationBarHeight:(CGFloat)offset
{
    [UIView animateWithDuration:0.3f animations:^{
        self.navigationController.navigationBar.frame  = CGRectMake(
                                                                    self.navigationController.navigationBar.frame.origin.x,
                                                                    navigationY,
                                                                    self.navigationController.navigationBar.frame.size.width,
                                                                    offset
                                                                    );
    }];
    
}

-(void)changeNavigationBarTranslationY:(CGFloat)translationY
{
    self.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)setBaseViewBackGroundColor:(UIColor *)color{
    self.view.backgroundColor = color;
}

#pragma mark -- 设置navi背景图片 或纯色
-(void)set_NaviBackgroundWithImage:(UIImage *)image
{
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:image ];
    [self.navigationController.navigationBar setShadowImage:image];
}

- (void)set_NaviBackgroundWithColor:(UIColor *)color{
    
    UIImage *image = [UIImage imageWithColor:color];
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}


#pragma mark -- NaviTitle
-(void)set_NaviTitle:(NSString *)title
{
    
    NSMutableAttributedString *attributTitle = [self changeNaviTitle:title];
    
    UILabel *navTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    navTitleLabel.numberOfLines=0;//可能出现多行的标题
    [navTitleLabel setAttributedText:attributTitle];
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    navTitleLabel.backgroundColor = [UIColor clearColor];
    navTitleLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(naviTitle_click_event:)];
    [navTitleLabel addGestureRecognizer:tap];
    self.navigationItem.titleView = navTitleLabel;
}

#pragma mark -- left_button
-(BOOL)leftButton
{
    BOOL isleft =  [self respondsToSelector:@selector(set_leftButton)];
    if (isleft) {
        UIButton *leftbutton = [self set_leftButton];
        [leftbutton addTarget:self action:@selector(naviLeft_click_event:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
        self.navigationItem.leftBarButtonItem = item;
    }
    return isleft;
}

#pragma mark -- right_button
-(BOOL)rightButton
{
    BOOL isright = [self respondsToSelector:@selector(set_rightButton)];
    if (isright) {
        UIButton *right_button = [self set_rightButton];
        //方法一 改变edgeInset（默认一个）
//        [right_button setImageEdgeInsets:UIEdgeInsetsMake(0, -6, 0, 6)];
        [right_button addTarget:self action:@selector(naviRight_click_event:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:right_button];
        //方法二
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
        negativeSpacer.width = -6;
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, item, nil];
//        self.navigationItem.rightBarButtonItem = item;
    }
    return isright;
}

#pragma mark -- left_item
-(void)configLeftBaritemWithImage
{
    if ([self respondsToSelector:@selector(set_leftBarButtonItemWithImage)]) {
        UIImage *image = [self set_leftBarButtonItemWithImage];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleBordered target:self  action:@selector(naviLeft_click_event:)];
        self.navigationItem.backBarButtonItem = item;
    }
}

-(void)configRightBaritemWithImage
{
    if ([self respondsToSelector:@selector(set_rightBarButtonItemWithImage)]) {
        UIImage *image = [self set_rightBarButtonItemWithImage];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleBordered target:self  action:@selector(naviRight_click_event:)];
        self.navigationItem.rightBarButtonItem = item;
    }
}

#pragma mark -- delegate
-(void)naviTitle_click_event:(UIGestureRecognizer*)Tap{
    
}
-(void)naviLeft_click_event:(UIButton *)sender{
    
}
-(void)naviRight_click_event:(UIButton *)sender{
    
}

#pragma mark - RAC
/**
 *  添加控件
 */
- (void)addSubviews {}

/**
 *  绑定
 */
- (void)bindViewModel {}

/**
 *  设置navation
 */
- (void)layoutNavigation {}

/**
 *  初次获取数据
 */
- (void)getNewData {}


-(NSMutableAttributedString *)changeNaviTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:kBoldFont(18) range:NSMakeRange(0, title.length)];
    return title;
}

- (NetManager *)netManager{
    if (_netManager == nil) {
        _netManager = [NetManager manager];
    }
    return _netManager;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

//通知监听回调 网络状态发送改变 系统会发出一个kReachabilityChangedNotification通知，然后会触发此回调方法
- (void)netStatusChange:(NSNotification *)noti{
    NSLog(@"-----%@",noti.userInfo);
    //判断网络状态
    switch (self.hostReach.currentReachabilityStatus) {
        case NotReachable:
            [MBProgressHUD showInfo:@"当前网络连接失败，请查看设置" ToView:self.view];
            break;
        case ReachableViaWiFi:
            NSLog(@"wifi上网2");
            break;
        case ReachableViaWWAN:
            NSLog(@"手机上网2");
            break;
        default:
            break;
    }
}

@end
