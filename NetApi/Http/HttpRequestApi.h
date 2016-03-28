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

FOUNDATION_EXPORT NSString* _Nonnull const UPLOAD_NSDATA_KEY;
FOUNDATION_EXPORT NSString* _Nonnull const UPLOAD_URL_KEY;

@interface HttpRequestApi : NSObject

/**
 *  HTTP REQUEST API WITH DELEGATE
 *
 *  @param requestData REQUEST DATA
 *  @param callback    CALLBACK DELAGATE
 */
- (void)httpWithRequestModel:(NetRequestModel* _Nonnull)requestData callback:(id<NetworkCallback> _Nullable)callback;


/**
 *  HTTP REQUEST API WITH BLOCK
 *
 *  @param requestData REQUEST DATA
 *  @param successData SUCCESS CALLBACK
 *  @param failData    FAIL CALLBACK
 */
- (void)httpWithRequestModel:(NetRequestModel* _Nonnull)requestData successCallback:(NetworkCallbackBlock _Nullable)successData failCallback:(NetworkCallbackBlock _Nullable)failData;

/**
 *  COMMON UPLOAD WITH REQUEST DATA
 *
 *  @param requestData REQUEST DATA, THIS DATA MUST CONTENT THE NSDATA KEY OR UPLOAD URL
 *  @param callback    REQUEST CALLBACK
 */
- (void)httpUploadWithUrl:(NetRequestModel* _Nonnull)requestData callback:(NetworkGeneralCallbackBlock _Nullable)callback;

@end
