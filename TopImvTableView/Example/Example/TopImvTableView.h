//
//  TopImvTableView.h
//  del
//
//  Created by lzn on 15/8/25.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopImvTableView : UITableView
/**
 *  在 TableView 上顶部增加一个图片控件,下拉实现图片放大效果
 *  缺陷:暂不支持横屏
 *  @param img       图片数据
 *  @param imvheight 图片高度 >= 20,如果赋值小于20会强行赋值20
 */
- (void)addTopExpandImvWith:(UIImage *)img imvHeight:(CGFloat)imvHeight;

/**
 *  必须在TopImvTableView对象代理方法中,让TopImvTableView对象调用此方法
 *
 *  @param scrollView TopImvTableView对象自身
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
@end
