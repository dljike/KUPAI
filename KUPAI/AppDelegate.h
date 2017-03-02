//
//  AppDelegate.h
//  KUPAI
//
//  Created by 杜博 on 2017/3/2.
//  Copyright © 2017年 ------DuBo------. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGHTabBarController.h"
#import "Header.h"
#if kPanUISwitch
#import "YGHScreenShotView.h"
#endif

#undef APP_DELEGATE
#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
@class YGHTabBarController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
  YGHTabBarController *tabBarViewController_;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, readonly, strong) YGHTabBarController *tabBarViewController;
#if kPanUISwitch
@property (strong, nonatomic) YGHScreenShotView *screenshotView;
#endif
+ (AppDelegate *)currentAppDelegate;

@end

