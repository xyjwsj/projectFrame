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

- (void)httpWithRequestModel:(NetRequestModel* _Nonnull)requestData callback:(id<NetworkCallback> _Nullable)callback;

@end
