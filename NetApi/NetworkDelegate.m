//
//  NetworkDelegate.m
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import "NetworkDelegate.h"

@implementation NetworkDelegate {
    NetworkCallbackBlock _Nullable _successCallback;
    NetworkCallbackBlock _Nullable _failCallback;
}

- (nonnull instancetype)initWithSuccessBlock:(NetworkCallbackBlock _Nullable)successBlock failBlock:(NetworkCallbackBlock _Nullable)failBlock {
    if (self = [super init]) {
        _successCallback = successBlock;
        _failCallback = failBlock;
    }
    return self;
}

-(void)netFailData:(NetResponseModel * _Nonnull)data {
    if (_failCallback) {
        _failCallback(data);
    }
}

-(void)netSuccessData:(NetResponseModel * _Nonnull)data {
    if (_successCallback) {
        _successCallback(data);
    }
}

@end
