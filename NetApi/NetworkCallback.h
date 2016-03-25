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

#endif