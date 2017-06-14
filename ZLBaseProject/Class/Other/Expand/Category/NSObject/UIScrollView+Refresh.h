//
//  UIScrollView+Refresh.h
//  BaseProject
//
//  Created by LiuLei on 16/5/17.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface UIScrollView (Refresh)
/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;
/** 开始头部刷新 */
- (void)beginHeaderRefresh;
/** 结束头部刷新 */
- (void)endHeaderRefresh;
/** 添加脚部刷新 */
- (void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;
/** 开始脚部刷新 */
- (void)beginFooterRefresh;
/** 结束脚部刷新 */
- (void)endFooterRefresh;
/**没有更多**/
-(void)noticeNoMoreData;
/**设置没有更多状态闲置**/
-(void)resetNoMoreData;
@end













