//
//  HttpRequestApi.m
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#import "HttpRequestApi.h"

NSString* const UPLOAD_NSDATA_KEY = @"project_frame_upload_nsdata_key";
NSString* const UPLOAD_URL_KEY = @"project_frame_upload_url_key";

@implementation HttpRequestApi

- (void)httpWithRequestModel:(NetRequestModel *)requestData callback:(id<NetworkCallback>)callback {
    NSURL* URL = [NSURL URLWithString:requestData._requestUrl];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
    if ([self updateRequestHeader:request requestData:requestData] && [self updateRequestBody:request requestData:requestData]) {
        [request setTimeoutInterval:requestData._timeout];
        NSURLSession* session = [NSURLSession sharedSession];
        NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NetResponseModel* responseData = [[NetResponseModel alloc] initWithData:data resopnse:response error:error];
            NSHTTPURLResponse* httpURLResponse = (NSHTTPURLResponse*)response;
            NSInteger statusCode = [httpURLResponse statusCode];
            if (statusCode != 200) {
                if (callback) {
                    [callback netFailData:responseData];
                }
                return;
            }
            if (callback) {
                [callback netSuccessData:responseData];
            }
            
        }];
        [task resume];
    } else {
        NSLog(@"config http request fail");
        
    }
}

- (void)httpWithRequestModel:(NetRequestModel *)requestData successCallback:(NetworkCallbackBlock)successCallback failCallback:(NetworkCallbackBlock)failCallback {
    [self httpWithRequestModel:requestData callback:[[NetworkDelegate alloc] initWithSuccessBlock:^(NetResponseModel * _Nonnull data) {
        if (successCallback) {
            successCallback(data);
        }
    } failBlock:^(NetResponseModel * _Nonnull data) {
        if (failCallback) {
            failCallback(data);
        }
    }]];
}


- (BOOL)updateRequestHeader:(NSMutableURLRequest*)request requestData:(NetRequestModel*)data {
    if (data._headers) {
        @try {
            [request setAllHTTPHeaderFields:data._headers];
        }
        @catch (NSException *exception) {
            NSLog(@"add request header fail");
            return NO;
        }
        @finally {
            
        }
    }
    return YES;
}

- (BOOL)updateRequestBody:(NSMutableURLRequest*)request requestData:(NetRequestModel*)data {
    if (data._params) {
        NSArray* allKey = [data._params allKeys];
        for (NSString* key in allKey) {
            [request setValue:[data._params objectForKey:key] forHTTPHeaderField:key];
        }
    }
    return YES;
}

- (void)httpUploadWithUrl:(NetRequestModel *)requestData callback:(NetworkGeneralCallbackBlock)callback {
    
    NSArray* keys = [requestData._params allKeys];
    if ([keys containsObject:UPLOAD_NSDATA_KEY] && [keys containsObject:UPLOAD_URL_KEY]) {
        NSLog(@"can not containt also include keys");
        return;
    }
    if (![keys containsObject:UPLOAD_NSDATA_KEY] && ![keys containsObject:UPLOAD_URL_KEY]) {
        NSLog(@"can not containt also include keys");
        return;
    }
    
    NSURL *URL = [NSURL URLWithString:requestData._requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    if ([keys containsObject:UPLOAD_NSDATA_KEY] && ![keys containsObject:UPLOAD_URL_KEY]) {
        //nsdata 上传
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:[requestData._params objectForKey:UPLOAD_NSDATA_KEY]
                                                          completionHandler:
                                              ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                  
                                              }];
        
        [uploadTask resume];
    }
    if (![keys containsObject:UPLOAD_NSDATA_KEY] && [keys containsObject:UPLOAD_URL_KEY]) {
        //url 上传
        [session uploadTaskWithRequest:request fromFile:[NSURL URLWithString:[requestData._params objectForKey:UPLOAD_URL_KEY]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
        }];
    }
}

- (void)download {
    NSURL *URL = [NSURL URLWithString:@"http://example.com/file.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request
                                                            completionHandler:
                                              ^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                  NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
                                                  NSURL *documentsDirectoryURL = [NSURL fileURLWithPath:documentsPath];
                                                  NSURL *newFileLocation = [documentsDirectoryURL URLByAppendingPathComponent:[[response URL] lastPathComponent]];
                                                  [[NSFileManager defaultManager] copyItemAtURL:location toURL:newFileLocation error:nil];
                                              }];
    
    [downloadTask resume];
}

@end
