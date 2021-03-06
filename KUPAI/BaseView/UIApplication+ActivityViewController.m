//
//  UIApplication+ActivityViewController.m
//  DemoProject
//
//  Created by yeguoshuai on 16/5/27.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "UIApplication+ActivityViewController.h"

@implementation UIApplication (ActivityViewController)
- (UIViewController *)activityViewController {
    __block UIWindow *normalWindow = [self.delegate window];
    if (normalWindow.windowLevel != UIWindowLevelNormal) {
        [self.windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.windowLevel == UIWindowLevelNormal) {
                normalWindow = obj;
                *stop        = YES;
            }
        }];
    }
    
    return [self p_nextTopForViewController:normalWindow.rootViewController];
}

- (UIViewController *)p_nextTopForViewController:(UIViewController *)inViewController {
    while (inViewController.presentedViewController) {
//        NSLog(@"-- 1 --->>>>%@",NSStringFromClass(inViewController.class));
        inViewController = inViewController.presentedViewController;
//        NSLog(@"-- 2 --->>>>%@",NSStringFromClass(inViewController.class));
    }
    
    if ([inViewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedVC = [self p_nextTopForViewController:((UITabBarController *)inViewController).selectedViewController];
        return selectedVC;
    } else if ([inViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *selectedVC = [self p_nextTopForViewController:((UINavigationController *)inViewController).visibleViewController];
        return selectedVC;
    } else {
        return inViewController;
    }
}
@end
