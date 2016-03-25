//
//  NetResponseModel.h
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetMacro.h"

@interface NetResponseModel : NSObject

/**
 *  RESPONSE HEADER DATA
 *  THIS DATA CAN BE NULL,IF YOU WILL USE IT, YOU MUST TEST IS NOT NULL
 */
@property (nonatomic, readonly) NSDictionary* _Nullable _headers;

/**
 *  RESPONSE ORIGIN DATA
 *  THIS DATA NOT VONVERT, IT'S FROM APPLE API
 */
@property (nonatomic, readonly) NSData* _Nullable _originData;

/**
 *  CUSTOMER EXPECT NET CAN RETURN THIS TYPE DATA
 *  YOU CAN SET THIS PARAM BEFORE YOU WANT THIS TYPE DATA
 */
@property (nonatomic, readwrite, assign) NET_RESPONSE_DATA_TYPE _expectDataType;

/**
 *  EXPECT DATA, THIS DATA IS POSSIBLE NULL
 *  BEFORE YOU GET THIS DATA,YOU MUST SET EXPECT DATA TYPE, OR NOT YOU WILL GET NULL OR NIL
 */
@property (nonatomic, readonly) id _Nullable _convertData;

/**
 *  NET ERROR
 */
@property (nonatomic, readonly) NSError* _Nullable _error;

/**
 *  INITALIZE RESPONSE DATA
 *
 *  @param data     RESPONSE ORIGIN DATA
 *  @param response RESPONSE
 *  @param error    ERROR
 *
 *  @return RESPONSE OBJ
 */
- (nonnull instancetype)initWithData:(NSData* _Nonnull)data resopnse:(NSURLResponse* _Nonnull)response error:(NSError* _Nullable)error;

@end
