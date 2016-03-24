//
//  NSString+UIExtend.m
//  projectFrame
//
//  Created by Hoolai on 16/3/24.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import "NSString+UIExtend.h"

@implementation NSString (UIExtend)

- (CGSize)sizeByFont:(UIFont*)font width:(CGFloat)width height:(CGFloat)height {
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    label.font = font;
    
    label.text = self;
    
    label.numberOfLines = 0;
    
    return [label sizeThatFits:CGSizeMake(width, height)];
}

@end
