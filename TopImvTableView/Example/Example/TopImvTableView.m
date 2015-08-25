//
//  TopImvTableView.m
//  del
//
//  Created by lzn on 15/8/25.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import "TopImvTableView.h"

@interface TopImvTableView()
@property(nonatomic,strong) UIImageView *imv;
@property(nonatomic,assign) CGFloat imvOriginHeight;
@property(nonatomic,assign) CGFloat imvTempHeight;

@end

@implementation TopImvTableView

- (void)addTopExpandImvWith:(UIImage *)img imvHeight:(CGFloat)imvHeight
{
    self.imvOriginHeight = (imvHeight < 20) ? 20 : imvHeight;
    self.imvTempHeight = self.imvOriginHeight * 80 / 200.0;
    self.contentInset = UIEdgeInsetsMake(self.imvOriginHeight, 0, 0, 0);
    NSAssert([img isKindOfClass:[UIImage class]], @"UITableView (AddTopExpandImv) : 提供的图片数据对象不是 UIImage 对象");
    self.imv = [[UIImageView alloc] initWithImage:img];
    self.imv.frame = CGRectMake(0, 0-self.imvOriginHeight-self.imvTempHeight, self.bounds.size.width, self.imvOriginHeight+self.imvTempHeight);
    [self addSubview:self.imv];
    self.imv.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + self.imvOriginHeight)/2;
    if (yOffset < -self.imvOriginHeight) {
        CGRect f = self.imv.frame;
        f.origin.y = yOffset - self.imvTempHeight;
        f.size.height =  -yOffset + self.imvTempHeight;
        f.origin.x = xOffset;
        f.size.width = self.bounds.size.width + fabs(xOffset)*2;
        self.imv.frame = f;
    }
}

@end
