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
_timeout,
_returnDataType;

-(instancetype)initWithUrl:(NSString *)url header:(NSDictionary<NSString *,NSString *> *)header params:(NSDictionary<NSString *,NSString *> *)params {
    if (self = [super init]) {
        _requestUrl = url;
        _method = GET;
        _headers = header;
        _params = params;
        _timeout = 10;
        _returnDataType = NOSET;
    }
    return self;
}

@end
