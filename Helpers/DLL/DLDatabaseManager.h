//
//  DLDatabaseManager.h
//  projectFrame
//
//  Created by Hoolai on 16/3/28.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLDatabaseManager : NSObject

+ (nonnull instancetype)sharedInstance:(NSString* _Nonnull)fileName;

@end
