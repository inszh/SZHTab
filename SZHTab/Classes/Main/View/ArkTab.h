//
//  ArkTab.h
//  SZHTab
//
//  Created by 小华 on 15/12/10.
//  Copyright © 2015年 ark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArkTab;

@protocol ArkTabDelegate <NSObject>

@optional

-(void)artTabBar:(ArkTab *)tab From:(long)from To:(long)to;

@end

@interface ArkTab : UIView

@property(nonatomic,assign)id<ArkTabDelegate> delegate;

-(void)setupTabWith:(UITabBarItem *)item;

@end
