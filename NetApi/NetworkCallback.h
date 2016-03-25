//
//  NetworkCallback.h
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetMacro.h"

@protocol NetworkCallback <NSObject>


/**
 *  NET REQUEST SUCCESS
 *  CALLBACK METHOD
 *
 *  @param data CALLBAKC DATA
 *  @param type DATA TYPE
 */
- (void)netSuccessData:(id)data type:(NET_RESPONSE_DATA_TYPE)type;


/**
 *  NET REQUEST FAIL
 *  CALLBACK METHOD
 *
 *  @param data SERVER RETURN DATA
 *  @param code ERROR CODE
 *  @param type SERVER RETURN DATA TYPE
 */
- (void)netFailData:(id)data errorCode:(NET_STATUS_CODE)code type:(NET_RESPONSE_DATA_TYPE)type;


/**
 *  NET REQUEST TIMEOUT
 *  CALLBACK METHOD
 *
 *  @param reseson TIMEOUT REASON
 */
- (void)netTimeOut:(NSString*)reason;

@end
