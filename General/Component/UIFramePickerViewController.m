//
//  UICommonPickerViewController.m
//  accesslive
//
//  Created by Hoolai on 16/1/7.
//  Copyright © 2016年 wsj_hoolai. All rights reserved.
//

#ifndef UICommonPickerViewController_Config
 #define DATE_PICKER_HEIGHT 216
#define ARRAY_PICKER_HEIGHT 162
#define TOOL_BAR_HEIGHT 30
#define BAR_BTN_LRSPACE 10
#endif

#import "UIFramePickerViewController.h"
#import "NSString+UIExtend.h"

@implementation UIFramePickerViewController {
    
    UIDatePicker* datePicker;
    UIPickerView* arrayPicker;
    PickerViewType showType;
    CGFloat showHeight;
    PickerBlock dataCallback;
    NSDictionary<NSString*, NSArray<NSString*>*>* arrayShowData;
    
    NSMutableDictionary<NSString*, NSString*>* selectData;
}

@synthesize isShow;

- (id)initWithType:(PickerViewType)type data:(NSDictionary<NSString*, NSArray<NSString*>*>*)showData {
    if (self = [super init]) {
        showType = type;
        arrayShowData = showData;
        selectData = [[NSMutableDictionary alloc] initWithCapacity:5];
        isShow = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (showType == DATE_PICKER) {
        [self initDateView];
    }
    if (showType == ARRAY_PICKER) {
        [self initArrayView];
    }
}


//////////////////////////////////////////////////////////////////////
//toolbar 按钮控件初始化
//////////////////////////////////////////////////////////////////////
- (void)setToolBar {
    
    UIFont* font = [UIFont systemFontOfSize:15];
    
    UIView* toolBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, TOOL_BAR_HEIGHT)];
    toolBarView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    toolBarView.userInteractionEnabled = YES;
    [self.view addSubview:toolBarView];
    
    NSString* cancleStr = @"取消";
    NSString* sureStr = @"确定";
    
    
    
    CGSize cancleSize = [cancleStr sizeByFont:font width:self.view.frame.size.width height:TOOL_BAR_HEIGHT];
    
    CGSize sureSize = [sureStr sizeByFont:font width:self.view.frame.size.width height:TOOL_BAR_HEIGHT];
    
    
    UIButton* cancleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, cancleSize.width, cancleSize.height)];
    [cancleBtn setTitle:cancleStr forState:UIControlStateNormal];
    cancleBtn.titleLabel.text = cancleStr;
    cancleBtn.backgroundColor = [UIColor clearColor];
    [cancleBtn setTitleColor:[UIColor colorWithRed:96/255.0 green:211/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    cancleBtn.titleLabel.font = font;
    cancleBtn.center = toolBarView.center;
    
    CGRect cancleFrame = cancleBtn.frame;
    cancleFrame.origin.x = BAR_BTN_LRSPACE;
    cancleBtn.frame = cancleFrame;
    
    [cancleBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [toolBarView addSubview:cancleBtn];
    
    
    UIButton* sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, sureSize.width, sureSize.height)];
    [sureBtn setTitle:sureStr forState:UIControlStateNormal];
    sureBtn.backgroundColor = [UIColor clearColor];
    [sureBtn setTitleColor:[UIColor colorWithRed:96/255.0 green:211/255.0 blue:251/255.0 alpha:1.0] forState:UIControlStateNormal];
    sureBtn.titleLabel.font = font;
    
    sureBtn.center = toolBarView.center;
    
    CGRect sureFrame = sureBtn.frame;
    sureFrame.origin.x = toolBarView.frame.size.width - BAR_BTN_LRSPACE - sureBtn.frame.size.width;
    sureBtn.frame = sureFrame;
    
    [sureBtn addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [toolBarView addSubview:sureBtn];
}

- (void)sureAction:(id)sender {
    if (dataCallback) {
        if (showType == DATE_PICKER) {
            dataCallback(YES, datePicker.date);
        }
        if (showType == ARRAY_PICKER) {
            [self updateSelectData];
            dataCallback(YES, selectData);
        }
    }
    [self close];
}

//////////////////////////////////////////////////////////////////////
//date类型控件初始化
//////////////////////////////////////////////////////////////////////
- (void)initDateView {
    
    showHeight = TOOL_BAR_HEIGHT + DATE_PICKER_HEIGHT;
    
    [self setToolBar];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, TOOL_BAR_HEIGHT, self.view.frame.size.width, DATE_PICKER_HEIGHT)];
    datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    datePicker.locale = locale;
    datePicker.datePickerMode=UIDatePickerModeDate;
    
    datePicker.maximumDate = [NSDate date];
    
    [self.view addSubview:datePicker];
}


//////////////////////////////////////////////////////////////////////
//自定义数据控件初始化
//////////////////////////////////////////////////////////////////////
- (void)initArrayView {
    
    showHeight =  TOOL_BAR_HEIGHT + ARRAY_PICKER_HEIGHT;
    
    [self setToolBar];
    
    arrayPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, TOOL_BAR_HEIGHT, self.view.frame.size.width,ARRAY_PICKER_HEIGHT)];
    arrayPicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
    arrayPicker.delegate = self;
    arrayPicker.dataSource = self;
    
    [self.view addSubview:arrayPicker];
    [self selectArrayData];
}

- (void)selectArrayData {
    for (int i = 0; i < [arrayShowData count]; i ++) {
        NSArray* arrayValue = [arrayShowData objectForKey:[NSString stringWithFormat:@"%d", i]];
        [arrayPicker selectRow:([arrayValue count] / 2) inComponent:i animated:YES];
    }
}


- (void)updateSelectData {
    for (int i = 0; i < [arrayShowData count]; i ++) {
        NSInteger row = [arrayPicker selectedRowInComponent:i];
        NSString* value = [[arrayShowData objectForKey:[NSString stringWithFormat:@"%d", i]] objectAtIndex:row];
        [selectData setObject:value forKey:[NSString stringWithFormat:@"%d", i]];
    }
}

#pragma mark arrayPickView数据源方法

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [arrayShowData count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[arrayShowData objectForKey:[NSString stringWithFormat:@"%lu", (long)component]] count];
}

#pragma mark arrayPickViewdelegate

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[arrayShowData objectForKey:[NSString stringWithFormat:@"%lu", (long)component]] objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString* value = [[arrayShowData objectForKey:[NSString stringWithFormat:@"%ld", (long)component]] objectAtIndex:row];
    [selectData setObject:value forKey:[NSString stringWithFormat:@"%lu", (long)component]];
}

/////////////////////////////////////////////////////////////////////////////////////////////
//动画
- (void)showInController:(UIViewController *)controller pickerCallbakc:(PickerBlock)callback{
    if (isShow) {
        return;
    }
    CGRect frame = self.view.frame;
    frame.origin.y = controller.view.frame.size.height;
    CGRect startFrame = frame;
    frame.origin.y = controller.view.frame.size.height - showHeight;
    CGRect endFrame = frame;
    
    self.view.frame = startFrame;
    
    [controller.view addSubview:self.view];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = endFrame;
        dataCallback = callback;
        isShow = YES;
    }];
}

- (void)close {
    if (!isShow) {
        return;
    }
    CGRect frame = self.view.frame;
    frame.origin.y = self.view.frame.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        isShow = NO;
    }];
}

@end
