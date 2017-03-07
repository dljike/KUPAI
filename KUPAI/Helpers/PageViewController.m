//
//  PageViewController.m
//  KUPAI
//
//  Created by 杜博 on 2017/3/2.
//  Copyright © 2017年 ------DuBo------. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mytableview;

@property (nonatomic) NSInteger count;
@end

@implementation PageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.count = 20;

    self.mytableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        [self refreshAction];
    }];
    self.mytableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self refreshAction];
    }];
    
}

-(void)refreshAction{

    self.count += 10;
    [self.mytableview reloadData];
    [self.mytableview.mj_header endRefreshing];
    [self.mytableview.mj_footer endRefreshing];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%@页---%ld行",self.pageNum,(long)indexPath.row];
    return cell;
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
