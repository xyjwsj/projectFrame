//
//  NetworkCallback.h
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#ifndef NetworkCallback_h
#define NetworkCallback_h

#import <Foundation/Foundation.h>
#import "NetMacro.h"
#import "NetResponseModel.h"


@protocol NetworkCallback <NSObject>


/**
 *  NET REQUEST SUCCESS
 *  CALLBACK METHOD
 *
 *  @param data CALLBAKC DATA
 */
- (void)netSuccessData:(NetResponseModel* _Nonnull)data;


/**
 *  NET REQUEST FAIL
 *  CALLBACK METHOD
 *
 *  @param data SERVER RETURN DATA
 */
- (void)netFailData:(NetResponseModel* _Nonnull)data;

@end

/**
 *  BLOCK CALLBACK
 *
 *  @param data NET RESPONSE DATA
 */
typedef void (^NetworkCallbackBlock)(NetResponseModel* _Nonnull data);

/**
 *  GENERAL NET BLOCK CALLBACK
 *
 *  @param result REQUEST RESULT
 *  @param data   CALLBACK DATA
 */
typedef void (^NetworkGeneralCallbackBlock)(BOOL result, NSData* _Nullable data);

@interface NetworkDelegate : NSObject<NetworkCallback>

/**
 *  INITAIZED NET CALLBACK DELEGATE
 *
 *  @param successBlock SUCCESS BLOCK
 *  @param failBlock    FAIL BLOCK
 *
 *  @return CALLBAKC DELEGATE
 */
- (nonnull instancetype)initWithSuccessBlock:(NetworkCallbackBlock _Nullable)successBlock failBlock:(NetworkCallbackBlock _Nullable)failBlock;

@end

#endif