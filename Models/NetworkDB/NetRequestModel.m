//
//  NetRequestModel.m
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import "NetRequestModel.h"

@implementation NetRequestModel

@synthesize _requestUrl,
_method,
_headers,
_params,
_timeout;

-(instancetype)initWithUrl:(NSString *)url method:(NET_REQUEST_METHOD)method header:(NSDictionary<NSString *,NSString *> *)header params:(NSDictionary<NSString *,NSString *> *)params {
    if (self = [super init]) {
        _requestUrl = url;
        _method = method;
        _headers = header;
        _params = params;
        _timeout = 10;
    }
    return self;
}

@end
