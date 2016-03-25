//
//  NetResponseModel.h
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetResponseModel : NSObject

@property (nonatomic, readonly) NSDictionary* _Nullable _headers;
@property (nonatomic, readonly) NSData* _Nullable _originData;
@property (nonatomic, readonly) id _Nullable _convertData;
@property (nonatomic, readonly) NSError* _Nullable _error;

- (nonnull instancetype)initWithData:(NSData* _Nonnull)data resopnse:(NSURLResponse* _Nonnull)response error:(NSError* _Nullable)error;

@end
