//
//  NetworkDelegate.h
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkCallback.h"
#import "NetResponseModel.h"

typedef void (^NetworkCallbackBlock)(NetResponseModel* _Nonnull data);

@interface NetworkDelegate : NSObject<NetworkCallback>

- (nonnull instancetype)initWithSuccessBlock:(NetworkCallbackBlock _Nullable)successBlock failBlock:(NetworkCallbackBlock _Nullable)failBlock;

@end
