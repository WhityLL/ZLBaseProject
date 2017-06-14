//
//  Constants.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#ifndef Constants_h
#define Constants_h


//************************ 获取设备屏幕尺寸以及适配 *******************************
#define SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define SCREEN_BOUNDS     [UIScreen mainScreen].bounds.size

// 字体大小(常规/粗体)
#define kBoldFont(x)     [UIFont boldSystemFontOfSize:x]
#define kfont(x)         [UIFont systemFontOfSize:x]
#define font(NAME, x)    [UIFont fontWithName:(NAME) size:(x)]

#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]

//不同屏幕尺寸字体适配（320，568是因为效果图为IPHONE5 如果不是则根据实际情况修改）
#define kScreenWidthRatio   (SCREEN_WIDTH / 320.0)
#define kScreenHeightRatio  (SCREENH_HEIGHT / 568.0)
#define AdaptedWidth(x)     ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x)    ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)  kfont(AdaptedWidth(R))

//************************ 获取设备屏幕尺寸以及适配 **************************************

//************************ 试图的最大(小)X,Y 试图 的 高度和宽度****************************
//试图的最大(小)X,Y 试图 的 高度和宽度
#define GetMaxX(view)   CGRectGetMaxX((view).frame)
#define GetMaxY(view)   CGRectGetMaxY((view).frame)
#define GetMinX(view)   CGRectGetMinX((view).frame)
#define GetMinY(view)   CGRectGetMinY((view).frame)
#define GetHeight(view) CGRectGetHeight((view).frame)
#define GetWidth(view)  CGRectGetWidth((view).frame)
//************************ 试图的最大(小)X,Y 试图 的 高度和宽度****************************

//************************ 设备大小*****************************************************
//最大的屏幕长度
#define SCREEN_MAX_LENGTH       (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
//最小屏幕长度
#define SCREEN_MIN_LENGTH       (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
//iphone4/4s最大屏幕长度
#define ISIPHONE4_OR_LESS       (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
//iphone5最大屏幕长度
#define ISIPHONE5               (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
//iphone6最大屏幕长度
#define ISIPHONE6               (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
//iphone6P最大屏幕长度
#define ISIPHONE6P              (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define ISIOS7_OR_LATER     ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.99)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#pragma mark - ViewSize
#define     NavHeight           44
#define     StateHeight         20
//************************ 设备大小*****************************************************



//************************ 支持横屏宏定义************************************************

//横屏的宽度
#define SCREEN_CROSS_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
//横屏的高度
#define SCREENH_CROSS_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
//横屏的大小
#define SCREEN_CROSS_SIZE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)

//************************ 支持横屏宏定义************************************************



//************************ 判断当前的设备/系统版本*****************************************

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f

//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))

//************************ 判断当前的设备/系统版本*****************************************



//************************ 判断是真机还是模拟器********************************************

#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//************************ 判断是真机还是模拟器********************************************


//************************ 设置颜色******************************************************
//RGB颜色
#define   ZLColor(r, g, b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
//设置RGBA颜色
#define   ZLAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//随机RGB颜色
#define   ZLRandomColor        [UIColor colorWithRed:(arc4random() % 255) / 255.0f green:(arc4random() % 255) / 255.0f blue:(arc4random() % 255) / 255.0f alpha:1.0]

/**HEX颜色(0x000000)*/
#define   HEXCOLOR(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define   HEXACOLOR(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

// clear背景颜色(清除背景色)
#define ClearColor     [UIColor clearColor]

//************************ 设置颜色******************************************************

//************************ 字体适配 ****************************************************
//#define ISIPHONE6P_FD (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) ? YES : NO)
//#define ISIPHONE6P1 (CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) ? YES : NO)
//#define ISIPHONE6P ((ISIPHONE6P_FD || ISIPHONE6P1) ? YES : NO)
//#define ISIPHONE6 (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) ? YES : NO)
//#define ISIPHONE5 (CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) ? YES : NO)
//#define ISIPHONE4 (CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) ? YES : NO)
//
//#define adjustFont(x)(x-(0*ISIPHONE6+x*0.02f)-(2*ISIPHONE5+x*0.02f)-(2*ISIPHONE4+x*0.02f))
//
//#define kFont(x) [UIFont fontWithName:@"Heiti SC" size:adjustFont(x)]
//#define kBlodFont(x) [UIFont boldSystemFontOfSize:adjustFont(x)]
//************************ 字体适配 ****************************************************




//************************ 自定义高效率的 NSLog*******************************************

//#if DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr,"---[方法名:%s]\n---[行号:%d]\n---打印内容:\n%s\n",__FUNCTION__, __LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(FORMAT, ...) nil
//#endif

//************************ 自定义高效率的 NSLog*******************************************


/*
 弱引用/强引用
 */
//弱引用
#define WeakSelf(type)    __weak typeof(type) weak##type = type;
//强引用
#define StrongSelf(type)  __strong typeof(type) type = weak##type;


//设置 view 圆角和边框
#define ViewBorderRadius(View, Radius, Width, Color,Bounds)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:(Bounds)];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

//获取当前语言与地区
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//获取当前时间
#define SystemTimerNow   (NSInteger)([[NSDate date] timeIntervalSince1970]*1000)
//获取版本号（Version）
#define kCurrentVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//获取appDelegate实例
#define appDelegateInstance  ((AppDelegate *)[[UIApplication sharedApplication] delegate])
//获取UUID
#define kUUID   [[NSUUID UUID] UUIDString]

//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
//************************  获取系统数据 ********************************************

//Library/Caches 文件路径
#define FilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#endif /* Constants_h */
