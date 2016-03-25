//
//  NetRequestModel.h
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetMacro.h"

@interface NetRequestModel : NSObject
/**
 *  REQUEST URL
 */
@property (nonatomic, readonly) NSString* __nonnull _requestUrl;

/**
 *  REQUEST METHOD
 */
@property (nonatomic, readonly, assign) NET_REQUEST_METHOD _method;

/**
 *  REQUEST HEADER
 */
@property (nonatomic, readonly) NSDictionary* __nullable _headers;

/**
 *  REQUEST PARAMS
 */
@property (nonatomic, readonly) NSDictionary* __nullable _params;

/**
 *  REQUEST TIMEOUT
 */
@property (nonatomic, readwrite) NSInteger _timeout;


/**
 *  INITALIZE REQUEST DATA
 *
 *  @param url    REQUEST URL
 *  @param method REQUEST METHOD
 *  @param header REQUEST HEADER INFO
 *  @param params REQUEST PARAMS INFO
 *
 *  @return REQUEST DATA OBJECT
 */
- (nonnull instancetype)initWithUrl:(NSString* _Nonnull)url method:(NET_REQUEST_METHOD)method header:(NSDictionary<NSString*, NSString*>* _Nullable)header params:(NSDictionary<NSString*, NSString*>* _Nullable)params;

@end
