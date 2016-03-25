//
//  HttpRequestApi.h
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkCallback.h"
#import "NetRequestModel.h"
#import "NetworkDelegate.h"

@interface HttpRequestApi : NSObject

/**
 *  HTTP REQUEST API
 *
 *  @param requestData REQUEST DATA
 *  @param callback    CALLBACK DELAGATE
 */
- (void)httpWithRequestModel:(NetRequestModel* _Nonnull)requestData callback:(id<NetworkCallback> _Nullable)callback;

- (void)httpWithRequestModel:(NetRequestModel* _Nonnull)requestData successCallback:(NetworkCallbackBlock _Nullable)successData failCallback:(NetworkCallbackBlock _Nullable)failData;

@end
