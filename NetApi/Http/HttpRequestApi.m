//
//  HttpRequestApi.m
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import "HttpRequestApi.h"

@implementation HttpRequestApi

- (void)httpWithRequestModel:(NetRequestModel *)requestData callback:(id<NetworkCallback>)callback {
    
}

- (BOOL)updateRequestHeader:(NSURLRequest*)request requestData:(NetRequestModel*)data {
    return YES;
}

- (BOOL)updateRequestBody:(NSURLRequest*)request requestData:(NetRequestModel*)data {
    return YES;
}

@end
