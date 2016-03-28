//
//  DLDatabaseManager.m
//  projectFrame
//
//  Created by Hoolai on 16/3/28.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#define DATABASE_SUFFIX @"PNG"

#import "DLDatabaseManager.h"

@implementation DLDatabaseManager

+ (instancetype)sharedInstance:(NSString *)fileName {
    static dispatch_once_t once;
    static DLDatabaseManager* instance;
    dispatch_once(&once, ^{
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        //获取数据库文件的路径
        NSString *dbPath = [docPath stringByAppendingPathComponent:fileName];
        //iOS 中管理文件的类, 负责复制文件, 删除文件, 移动文件
        NSFileManager *fm = [NSFileManager defaultManager];
        //判断document中是否有sqlite文件
        if (![fm fileExistsAtPath:dbPath]) {
            //获取在*.app中sqlite文件的路径
            NSString *boundlePath = [[NSBundle mainBundle] pathForResource:@"Database" ofType:@"sqlite"];
            NSError *error = nil;
            //将*.app中sqlite文件复制一份到dbPath
            BOOL result = [fm copyItemAtPath:boundlePath toPath:dbPath error:&error];
            //若复制文件失败, 打印错误信息
            if (!result) {
                NSLog(@"%@", error);
            }
        }
        //打开数据库 参数1: 文件路径(UTF8String可以将OC的NSString转为C中的char) 参数2: 接受数据库的指针
//        sqlite3_open([dbPath UTF8String], &db);
    });
    return instance;
}

@end
