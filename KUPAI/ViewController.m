//
//  ViewController.m
//  KUPAI
//
//  Created by 杜博 on 2017/3/2.
//  Copyright © 2017年 ------DuBo------. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//get请求
- (void)test_get
{
    NSString *url = @"http://www.baidu.com";
    NSDictionary *params = @{@"i":@"1"};
    [YBHttpTool get:url params:params success:^(NSDictionary *obj) {
        //成功
    } failure:^(NSError *error) {
        //失败
    }];
}

//get带缓存的请求
- (void)test_get_cache
{
    NSString *url = @"http://www.baidu.com";
    NSDictionary *params = @{@"i":@"1"};
    [YBHttpTool get:url params:params cacheType:YBCacheTypeReturnCacheDataThenLoad success:^(NSDictionary *obj) {
        //成功
    } failure:^(NSError *error) {
        //失败
    }];
}

//post请求
- (void)test_post
{
    NSString *url = @"http://www.baidu.com";
    NSDictionary *params = @{@"i":@"1"};
    [YBHttpTool post:url params:params success:^(NSDictionary *obj) {
        //成功
    } failure:^(NSError *error) {
        //失败
    }];
}

//post请求带缓存
- (void)test_post_cache
{
    NSString *url = @"http://www.baidu.com";
    NSDictionary *params = @{@"i":@"1"};
    [YBHttpTool post:url params:params cacheType:YBCacheTypeReturnCacheDataThenLoad success:^(NSDictionary *obj) {
        //成功
    } failure:^(NSError *error) {
        //失败
    }];
}

//上传单张图片
- (void)test_upload_image
{
    UIImage *image = [UIImage imageNamed:@"1"];
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    [YBHttpTool uploadImageWithImage:data success:^(NSDictionary *obj) {
        //上传成功
    } failure:^(NSError *error) {
        //上传失败
    }];
}

//上传多张图片
- (void)test_upload_imageArr
{
    UIImage *image = [UIImage imageNamed:@"1"];
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    NSArray *images = @[data, data];
    [YBHttpTool uploadImageArrayWithImages:images success:^(NSDictionary *obj) {
        //上传成功
    } failure:^(NSError *error) {
        //上传失败
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
