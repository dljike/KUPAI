//
//  SearchViewController.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "SearchViewController.h"
#import "DLScrollTabbarView.h"
#import "DLLRUCache.h"
#import "PageViewController.h"

@implementation SearchViewController

{
    NSMutableArray *itemArray_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = nil;
    [self setTitle:@"搜索"];
    self.slideView = [[DLCustomSlideView alloc] initWithFrame:CGRectMake(00, 64, ScreenWidth, ScreenHeight - 64)];
    self.slideView.delegate = self;
    [self.view addSubview:self.slideView];
    
    self.automaticallyAdjustsScrollViewInsets = NO; // 如果你使用了UITabBarController, 系统会自动调整scrollView的inset。加上这个如果出错的话。
    
    // Do any additional setup after loading the view from its nib.
    DLLRUCache *cache = [[DLLRUCache alloc] initWithCount:6];
    DLScrollTabbarView *tabbar = [[DLScrollTabbarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 34)];
    tabbar.tabItemNormalColor = [UIColor blackColor];
    tabbar.tabItemSelectedColor = [UIColor redColor];
    tabbar.tabItemNormalFontSize = 14.0f;
    tabbar.trackColor = [UIColor redColor];
    itemArray_ = [NSMutableArray array];
    DLScrollTabbarItem *item = [DLScrollTabbarItem itemWithTitle:@"推荐" width:80];
    [itemArray_ addObject:item];
    for (int i=0; i<10; i++) {
        item = [DLScrollTabbarItem itemWithTitle:[NSString stringWithFormat:@"页面%d", i+1] width:50];
        [itemArray_ addObject:item];
    }
    tabbar.tabbarItems = itemArray_;
    
    self.slideView.tabbar = tabbar;
    self.slideView.cache = cache;
    self.slideView.tabbarBottomSpacing = 5;
    self.slideView.baseViewController = self;
    [self.slideView setup];
    self.slideView.selectedIndex = 0;

    
}


- (NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender{
    return itemArray_.count;
}

- (UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index{
    PageViewController *ctrl = [[PageViewController alloc] init];
    int32_t rgbValue = rand();
    ctrl.view.backgroundColor = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    ctrl.pageNum = [NSString stringWithFormat:@"%ld", (long)index];
    return ctrl;
}

@end
