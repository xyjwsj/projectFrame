//
//  DDServerLogger.m
//  accesssdk
//
//  Created by Hoolai on 16/2/23.
//  Copyright © 2016年 wsj_hoolai. All rights reserved.
//

#import "DDServerLogger.h"

static DDServerLogger *sharedInstance;

@implementation DDServerLogger {
    NSString* udid;
}

@synthesize _logMessagesArray;

+ (instancetype)sharedInstance {
    static dispatch_once_t DDServerLoggerOnceToken;
    
    dispatch_once(&DDServerLoggerOnceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.deleteInterval = 0;
        self.maxAge = 0;
        self.deleteOnEverySave = NO;
        self.saveInterval = 60;
        self.saveThreshold = 500;
        //别忘了在 dealloc 里 removeObserver
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveOnSuspend)
                                                     name:@"UIApplicationWillResignActiveNotification"
                                                   object:nil];
        _logFormatter = self;
    }
    
    return self;
}

- (void)saveOnSuspend {
    dispatch_async(_loggerQueue, ^{
        [self db_save];
    });
}

- (BOOL)db_log:(DDLogMessage *)logMessage
{
    NSString * message = _logFormatter ? [_logFormatter formatLogMessage:logMessage] : logMessage->_message;
    
    if (!_logMessagesArray)
        _logMessagesArray = [NSMutableArray arrayWithCapacity:500]; // 我们的saveThreshold只有500，所以一般情况下够了
    
    if ([_logMessagesArray count] > 2000) {
        // 如果段时间内进入大量log，并且迟迟发不到服务器上，我们可以判断哪里出了问题，在这之后的 log 暂时不处理了。
        // 但我们依然要告诉 DDLog 这个存进去了。
        return YES;
    }
    
    //利用 formatter 得到消息字符串，添加到缓存
    [_logMessagesArray addObject:message];
    return YES;
}

- (void)db_save{
    //判断是否在 logger 自己的GCD队列中
    if (![self isOnInternalLoggerQueue])
        NSAssert(NO, @"db_saveAndDelete should only be executed on the internalLoggerQueue thread, if you're seeing this, your doing it wrong.");
    
    //如果缓存内没数据，啥也不做
    if ([_logMessagesArray count] == 0)
        return;
    
    //获取缓存中所有数据，之后将缓存清空
    NSArray *oldLogMessagesArray = [_logMessagesArray copy];
    _logMessagesArray = [NSMutableArray arrayWithCapacity:0];
    
    //用换行符，把所有的数据拼成一个大字符串
    NSString *logMessagesString = [oldLogMessagesArray componentsJoinedByString:@"\n|||"];
    
    //发送给咱自己服务器(自己实现了)
//    NSLog(@"sendServer=====%@", logMessagesString);
    
    
    
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage{
    NSMutableDictionary *logDict = [NSMutableDictionary dictionary];
    
    //取得文件名
    NSString *locationString;
    NSArray *parts = [logMessage->_file componentsSeparatedByString:@"/"];
    if ([parts count] > 0)
        locationString = [parts lastObject];
    if ([locationString length] == 0)
        locationString = @"No file";
    
    //这里的格式: {"location":"myfile.m:120(void a::sub(int)"}， 文件名，行数和函数名是用的编译器宏 __FILE__, __LINE__, __PRETTY_FUNCTION__
    logDict[@"location"] = [NSString stringWithFormat:@"%@:%lu(%@)", locationString, (unsigned long)logMessage->_line, logMessage->_function];
    
    //尝试将logDict内容转为字符串，其实这里可以直接构造字符串，但真实项目中，肯定需要很多其他的信息，不可能仅仅文件名、行数和函数名就够了的。
   
    return @"test";
    
//    NSError *error;
//    NSData *outputJson = [NSJSONSerialization dataWithJSONObject:logfields options:0 error:&error];
//    if (error)
//        return @"{\"location\":\"error\"}";
//        NSString *jsonString = [[NSString alloc] initWithData:outputJson encoding:NSUTF8StringEncoding];
//    if (jsonString)
//        return jsonString;
//    return @"{\"location\":\"error\"}";
}

@end
