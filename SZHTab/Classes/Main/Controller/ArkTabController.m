//
//  ArkTabController.m
//  SZHTab
//
//  Created by 小华 on 15/12/10.
//  Copyright © 2015年 ark. All rights reserved.
//

#import "ArkTabController.h"
#import "DiscoverController.h"
#import "TaskController.h"
#import "MessageController.h"
#import "GroupController.h"
#import "MEController.h"
#import "ArkTab.h"

@interface ArkTabController ()<ArkTabDelegate>

@property(nonatomic,weak)ArkTab *arkTab;


@end

@implementation ArkTabController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTab];

    [self setupTabVC];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }

}

-(void)setupTab
{
    ArkTab *arkTab= [[ArkTab alloc]init];
    arkTab.delegate=self;
    arkTab.frame=self.tabBar.bounds;
    [self.tabBar addSubview:arkTab];
    self.arkTab=arkTab;

}
-(void)artTabBar:(ArkTab *)tab From:(long)from To:(long)to
{
    self.selectedIndex=to;
}

-(void)setupTabVC
{
    DiscoverController *dic=[[DiscoverController alloc]init];
    [self setChildControllerWithVc:dic title:@"发现" Img:@"TabBar1" selImg:@"TabBar1Sel"];
    
    DiscoverController *dic2=[[DiscoverController alloc]init];
    [self setChildControllerWithVc:dic2 title:@"朋友" Img:@"TabBar2" selImg:@"TabBar2Sel"];
    DiscoverController *dic3=[[DiscoverController alloc]init];
    [self setChildControllerWithVc:dic3 title:@"任务" Img:@"TabBar3" selImg:@"TabBar3Sel"];
    
    DiscoverController *dic4=[[DiscoverController alloc]init];
    [self setChildControllerWithVc:dic4 title:@"我" Img:@"TabBar4" selImg:@"TabBar4Sel"];
    

}

-(void)setChildControllerWithVc:(UIViewController *)vc title:(NSString *)title Img:(NSString *)img selImg:(NSString *)selimg
{
    vc.title=title;
    
    vc.tabBarItem.image=[UIImage imageNamed:img];
    
    vc.tabBarItem.selectedImage=[UIImage imageNamed:selimg];

    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
    [self.arkTab setupTabWith:vc.tabBarItem];
    
}

@end
