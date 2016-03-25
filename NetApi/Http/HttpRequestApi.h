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
 *  UPLOAD WITH NSDATA
 *
 *  @param url        UPLOAD SERVER URL
 *  @param uploadData UPLOAD DATA
 *  @param callback   UPLOAD RESULT
 */
- (void)httpUploadWithUrl:(NSString* _Nonnull)url uploadData:(NSData* _Nonnull)uploadData callback:(NetworkGeneralCallbackBlock _Nullable)callback;

/**
 *  UPLOAD WITH RELATIVE PATH
 *
 *  @param url       UPLOAD SERVER URL
 *  @param uploadUrl DATA OF RELATIVE PATH
 *  @param callback  UPLOAD RESULT
 */
- (void)httpUploadWithUrl:(NSString* _Nonnull)url uploadUrl:(NSString* _Nonnull)uploadUrl callback:(NetworkGeneralCallbackBlock _Nullable)callback;

@end
