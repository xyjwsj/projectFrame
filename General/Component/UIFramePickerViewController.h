//
//  UICommonPickerViewController.h
//  accesslive
//
//  Created by Hoolai on 16/1/7.
//  Copyright © 2016年 wsj_hoolai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _PickerViewType {
    DATE_PICKER=0,
    ARRAY_PICKER
}PickerViewType;

#ifndef UIFramePickerViewController_Data_KEY
#define FIRST (@"0")
#define SECOND (@"1")
#define THIRD (@"2")
#define FOURTH (@"3")
#endif

#import <UIKit/UIKit.h>

typedef void (^PickerBlock)(BOOL result, id data);

@interface UIFramePickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource> {
    BOOL isShow;
}

@property (nonatomic, readwrite) BOOL isShow;

- (id)initWithType:(PickerViewType)type data:(NSDictionary<NSString*, NSArray<NSString*>*>*)showData;

- (void)showInController:(UIViewController*)controller pickerCallbakc:(PickerBlock)callback;

- (void)close;

@end
