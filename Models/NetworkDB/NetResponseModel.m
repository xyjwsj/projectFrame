//
//  NetResponseModel.m
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import "NetResponseModel.h"

@implementation NetResponseModel

@synthesize _headers,
_originData,
_convertData,
_error,
_expectDataType;

-(instancetype)initWithData:(NSData *)data resopnse:(NSURLResponse * _Nonnull)response error:(NSError * _Nullable)error {
    if (self = [super init]) {
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        if ([httpResponse respondsToSelector:@selector(allHeaderFields)]) {
            _headers = [httpResponse allHeaderFields];
        }
        _originData = data;
        _error = error;
    }
    return self;
}

- (id)_convertData {
    if (_expectDataType == STRING) {
        return [[NSString alloc] initWithData:_originData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
