//
//  PageViewController.m
//  KUPAI
//
//  Created by 杜博 on 2017/3/2.
//  Copyright © 2017年 ------DuBo------. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.pageLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 20)];
    self.pageLabel.textColor = [UIColor blueColor];
    [self.view addSubview:self.pageLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
