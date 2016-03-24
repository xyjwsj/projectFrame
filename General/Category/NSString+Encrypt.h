//
//  NSString+Encrypt.h
//  projectFrame
//
//  Created by Hoolai on 16/3/24.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(NSString_Encrypt)


/**
 *  字符串MD5加密
 *
 *  @return 加密后字符串
 */
- (NSString*)MD5;

/**
 *  字符串SHA1加密
 *
 *  @return 加密后字符串
 */
- (NSString*) SHA1;
@end
