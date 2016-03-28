//
//  DDServerLogger.h
//  accesssdk
//
//  Created by Hoolai on 16/2/23.
//  Copyright © 2016年 wsj_hoolai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDAbstractDatabaseLogger.h"

@interface DDServerLogger : DDAbstractDatabaseLogger<DDLogFormatter>

@property(nonatomic, readonly) NSMutableArray* _logMessagesArray;

+ (instancetype)sharedInstance;

@end
