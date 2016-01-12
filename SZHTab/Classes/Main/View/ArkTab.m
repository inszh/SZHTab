//
//  ArkTab.m
//  SZHTab
//
//  Created by 小华 on 15/12/10.
//  Copyright © 2015年 ark. All rights reserved.
//

#import "ArkTab.h"
#import "ArkButton.h"
#import "SentBtn.h"

@interface ArkTab()

@property(nonatomic,weak)ArkButton *button ;
@property(nonatomic,weak)SentBtn *sentBtn;
@property(nonatomic,strong)NSMutableArray * tabButtons;

@end

@implementation ArkTab


-(NSMutableArray *)tabButtons
{
    if (!_tabButtons) {
        _tabButtons=[NSMutableArray array];
    }
    return _tabButtons;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"TabBarIMG"]];
        
        SentBtn *sentBtn=[SentBtn sentBtn];
        sentBtn.bounds = CGRectMake(0, 0, sentBtn.currentBackgroundImage.size.width, sentBtn.currentBackgroundImage.size.height);
        self.sentBtn=sentBtn;
        [self insertSubview:sentBtn aboveSubview:self];
        
        [[UITabBar appearance] setShadowImage:[[UIImage alloc]init]];

    }
    return self;
}

-(void)setupTabWith:(UITabBarItem *)item
{
    ArkButton *button=[[ArkButton alloc]init];
    [self addSubview:button];
    button.item=item;
    [self.tabButtons addObject:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];

    if (self.tabButtons.count==1) {
        [self buttonClick:button];
    }
}

-(void)buttonClick:(ArkButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(artTabBar:From:To:)]) {
        [self.delegate artTabBar:self From:self.button.tag To:btn.tag];
    }
    
    self.button.selected=NO;
    btn.selected=YES;
    self.button=btn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.sentBtn.center=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5-20);
    
    CGFloat y=  0;
    CGFloat w=  self.frame.size.width/self.subviews.count;
    CGFloat h=  self.frame.size.height;
    
    for (int i=0; i<self.tabButtons.count; i++) {
        CGFloat x=  w*i;
        
        ArkButton *btn=self.tabButtons[i];
        
        if (i>1) {
            x+=w;
        }
        btn.frame=CGRectMake(x, y, w, h);
        btn.tag=i;
    }
}

@end
