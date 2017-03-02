//
//  UIApplication+ActivityViewController.h
//  DemoProject
//
//  Created by yeguoshuai on 16/5/27.
//  Copyright © 2016年 AK. All rights reserved.
//

/**
 *  获取当前最上边一层视图控制器
 */

#import <UIKit/UIKit.h>

@interface UIApplication (ActivityViewController)
- (UIViewController *)activityViewController;
@end
