//
//  UIScrollView+Refresh.m
//  BaseProject
//
//  Created by LiuLei on 16/5/17.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "UIScrollView+Refresh.h"
// 自定义的header

#define   HexColor(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UIScrollView (Refresh)

/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock{
    
    MJRefreshNormalHeader *normalHead =[MJRefreshNormalHeader headerWithRefreshingBlock:refreshBlock];
    [normalHead setTitle:NSLocalizedString(@"swipetorefresh_swipe_to_refresh", nil) forState:MJRefreshStateIdle];
    [normalHead setTitle:NSLocalizedString(@"swipetorefresh_release_to_refresh", nil) forState:MJRefreshStatePulling];
    [normalHead setTitle:NSLocalizedString(@"swipetorefresh_release_complete", nil) forState:MJRefreshStateRefreshing];
    
    // 设置字体
    normalHead.stateLabel.font = [UIFont systemFontOfSize:13];
    normalHead.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:13];
    
    // 设置颜色
    normalHead.stateLabel.textColor = HexColor(0x878787);
    normalHead.lastUpdatedTimeLabel.textColor = HexColor(0xababab);
    
    self.mj_header =normalHead;
}
/** 开始头部刷新 */
- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}
/** 结束头部刷新 */
- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}
/** 添加脚部刷新 */
- (void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock{
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:refreshBlock];
    
    footer.stateLabel.textColor = HexColor(0x878787);
    footer.ignoredScrollViewContentInsetBottom = 20;
    
    self.mj_footer= footer;
}
/** 开始脚部刷新 */
- (void)beginFooterRefresh{
    [self.mj_footer beginRefreshing];
}
/** 结束脚部刷新 */
- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}

/**没有更多**/
-(void)noticeNoMoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}
/**设置没有更多状态闲置**/
-(void)resetNoMoreData{
     [self.mj_footer resetNoMoreData];
}

@end













