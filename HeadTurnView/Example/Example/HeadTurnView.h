//
//  HeadTurnView.h
//  01_HeadTurnWork
//
//  Created by lzn on 15/8/24.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadTurnView : UIView

/**
 *  设置头像动画参数, default is UIViewAnimationOptionTransitionFlipFromLeft
 */
@property(nonatomic,assign) UIViewAnimationOptions animationOption;

/**
 *  是否圆形显示图片, default is YES
 */
@property(nonatomic,assign) BOOL isShowRound;

/**
 *  创建,控件现在只提供类方法这一个入口,只有通过此类方法创建,控件才能使用
 *
 *  @param frame    控件 frame
 *  @param imgArray UIImage 对象的数组,数量最少2个,且必须是 UIImage 对象
 *
 *  @return 头像控件 view
 */
+ (instancetype)createWithFrame:(CGRect)frame andImgs:(NSArray *)imgArray;

@end
