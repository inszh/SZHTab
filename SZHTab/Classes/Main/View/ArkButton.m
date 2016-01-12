//
//  ArkButton.m
//  SZHTab
//
//  Created by 小华 on 15/12/10.
//  Copyright © 2015年 ark. All rights reserved.
//

#import "ArkButton.h"

@implementation ArkButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)init
{
    if (self=[super init]) {
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.imageView.contentMode=NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted=NO;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [self setTitleColor:[UIColor lightGrayColor] forState:0];

    }
    return self;

}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x=0;
    CGFloat w=contentRect.size.width;
    CGFloat h=contentRect.size.height*0.3;
    CGFloat y=contentRect.size.height-h;

    return CGRectMake(x, y, w, h);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect;
{
    CGFloat x=0;
    CGFloat y=0;
    CGFloat w=contentRect.size.width;
    CGFloat h=contentRect.size.height*0.7;
    return CGRectMake(x, y, w, h);
}


-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    [self setTitle:item.title forState:0];
    [self setImage:item.image forState:0];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
}
@end
