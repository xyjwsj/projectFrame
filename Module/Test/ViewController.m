//
//  ViewController.m
//  projectFrame
//
//  Created by Hoolai on 16/3/24.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import "ViewController.h"
#import "HttpRequestApi.h"

@interface HttpDelegate : NSObject<NetworkCallback>

- (void)netSuccessData:(NetResponseModel *)data;
-(void)netFailData:(NetResponseModel *)data;

@end

@implementation HttpDelegate

- (void)netSuccessData:(NetResponseModel *)data {
    data._expectDataType = STRING;
    NSLog(@"response:%@", (NSString*)data._convertData);
}

- (void)netFailData:(NetResponseModel *)data {
    
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NetRequestModel* requestData = [[NetRequestModel alloc] initWithUrl:@"https://www.baidu.com" header:nil params:nil];
    requestData._timeout = 5;
    HttpRequestApi* httpService = [[HttpRequestApi alloc] init];
//    [httpService httpWithRequestModel:requestData callback:[[HttpDelegate alloc] init]];
    [httpService httpWithRequestModel:requestData successCallback:^(NetResponseModel * _Nonnull data) {
        data._expectDataType = STRING;
        NSLog(@"response:%@", (NSString*)data._convertData);
    } failCallback:^(NetResponseModel * _Nonnull data) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
