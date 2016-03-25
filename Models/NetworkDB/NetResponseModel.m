//
//  NetResponseModel.m
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import "NetResponseModel.h"

@implementation NetResponseModel

@synthesize _headers,
_originData,
_convertData,
_error;

-(instancetype)initWithData:(NSData *)data resopnse:(NSURLResponse * _Nonnull)response error:(NSError * _Nullable)error {
    
    if (self = [super init]) {
        
    }
    return self;
}

@end
