//
//  CategoryViewController.m
//  YGHTabBar
//
//  Created by YangGH on 16/5/3.
//  Copyright © 2016年 YangGH. All rights reserved.
//

#import "CategoryViewController.h"

#import <GRMustache/GRMustache.h>

@implementation CategoryViewController
{
    
    UIWebView *myWebView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = nil;
    [self setTitle:@"分类"];
    
    myWebView = [[UIWebView alloc ]initWithFrame:self.view.bounds];
    [self.view addSubview:myWebView];
    

    
    //通得模板渲染得到内容(可以随时修改对应标签的内容)
    NSString *rendering = [self demoFormatWithName:@"标题" value:@"内容"];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseUrl = [NSURL fileURLWithPath:path];
    [myWebView loadHTMLString:rendering baseURL:baseUrl];
    
    
}


-(NSString *)demoFormatWithName:(NSString *)name value:(NSString *)value{
    NSString *fileName = @"comentPage.html";
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
    NSString *template = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *renderObject = @{@"name":name,@"content":value,@"imgurl":@"http://wenwen.soso.com/p/20100615/20100615133657-1465173906.jpg"};
    NSString *content = [GRMustacheTemplate renderObject:renderObject fromString:template error:nil];
    return content;
}


@end
