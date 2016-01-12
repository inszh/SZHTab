//
//  SentBtn.m
//  SZHTab
//
//  Created by 小华 on 15/12/11.
//  Copyright © 2015年 ark. All rights reserved.
//

#import "SentBtn.h"

@implementation SentBtn

+(instancetype)sentBtn
{
    return [[self alloc]init];
}

-(instancetype)init
{
    if (self=[super init]) {
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = 1;
        self.adjustsImageWhenHighlighted=NO;
        [self setBackgroundImage:[UIImage imageNamed:@"pic"] forState:0];
        [self setImage:[UIImage imageNamed:@"TabBar5"] forState:0];
        [self setImage:[UIImage imageNamed:@"TabBar5Sel"] forState:0];
        
        [self setTitle:@"发布" forState:0];
        [self setTitleColor:[UIColor lightGrayColor] forState:0];

    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height*0.2;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = contentRect.origin.y+5;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageX = 0;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);

}


@end
