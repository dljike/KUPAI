//
//  SearchViewController.h
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "CommonViewController.h"
#import "DLCustomSlideView.h"


@interface SearchViewController : CommonViewController<DLCustomSlideViewDelegate>


@property (strong, nonatomic)  DLCustomSlideView *slideView;


@end
