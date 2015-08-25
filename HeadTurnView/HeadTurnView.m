//
//  HeadTurnView.m
//  01_HeadTurnWork
//
//  Created by lzn on 15/8/24.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import "HeadTurnView.h"

@interface HeadTurnView ()
@property(nonatomic,strong) NSArray *imgArray;
@property(nonatomic,strong) UIImageView *imvChange;
@property(nonatomic,strong) UIImageView *imvBack;
@property(nonatomic,assign) NSUInteger index;
@end

@implementation HeadTurnView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView transitionFromView:self.imvChange toView:self.imvBack duration:1.0 options:self.animationOption completion:^(BOOL finished) {
        self.imvChange.image = self.imvBack.image;
        [self addSubview:self.imvChange];
        [self.imvBack removeFromSuperview];
        self.imvBack.image = self.imgArray[self.index];
        if (self.imgArray.count == 2) {
            static BOOL recordTap = NO;
            recordTap = !recordTap;
            self.index = recordTap ? 1 : 0;
        }else {
            self.index = (++self.index < self.imgArray.count) ? self.index : ((self.index = 0)? 0 : 0);
        }
    }];
}


- (void)makeContentViewWith:(CGRect)bounds andImgs:(NSArray *)imgArray
{
    self.imgArray = imgArray;
    self.index = self.imgArray.count == 2 ? 0 : 2;
    self.imvChange = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imvChange.image = imgArray[0];
    self.imvChange.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self addSubview:self.imvChange];
    self.imvBack = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imvBack.image = imgArray[1];
    self.imvBack.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.isShowRound = YES;
}

+ (instancetype)createWithFrame:(CGRect)frame andImgs:(NSArray *)imgArray
{
    NSAssert(imgArray.count >= 2, @"HeadTurnView : 数据源图像数组数量不能小于2个");
    for (UIImage *item in imgArray) {
        if (![item isKindOfClass:[UIImage class]]) {
            NSAssert(false, @"HeadTurnView : 传入的图像数组中发现有不是 UIImage 对象的");
        }
    }
    HeadTurnView *mainView = [[HeadTurnView alloc] initWithFrame:frame];
    mainView.layer.cornerRadius = frame.size.width / 2.0;
    mainView.layer.masksToBounds = YES;
    mainView.animationOption = UIViewAnimationOptionTransitionFlipFromLeft;
    [mainView makeContentViewWith:mainView.bounds andImgs:imgArray];
    return mainView;
}

- (void)setIsShowRound:(BOOL)isShowRound
{
    _isShowRound = isShowRound;
    if (_isShowRound) {
            self.imvChange.layer.cornerRadius = self.imvChange.bounds.size.width / 2.0;
            self.imvBack.layer.cornerRadius = self.imvChange.bounds.size.width / 2.0;
            self.imvChange.layer.masksToBounds = YES;
            self.imvBack.layer.masksToBounds = YES;
    }else {
            self.imvChange.layer.cornerRadius = 0.0;
            self.imvBack.layer.cornerRadius = 0.0;
            self.imvChange.layer.masksToBounds = NO;
            self.imvBack.layer.masksToBounds = NO;
    }
}

@end
