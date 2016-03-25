//
//  HttpMacro.h
//  projectFrame
//
//  Created by Hoolai on 16/3/25.
//  Copyright © 2016年 wsj_proj. All rights reserved.
//

#ifndef NetMacro_h
#define NetMacro_h


/**
 * NET REQUEST RETURN STATUS CODE
 * THIS CODE WILL BE USE IN THE CALLBACK METHOD
 */
typedef enum _NET_STATUS_CODE {
    OK = 200,
    BAD_REQUEST = 400,
    NOT_FOUND = 404,
    INTERNAL_SERVER_ERROR = 500,
}NET_STATUS_CODE;


/**
 * NET REQUEST METHOD
 * But Now, GET AND POST CAN USE. THE OTHER METHOD IS NOT SUPPORT
 */
typedef enum _NET_REQUEST_METHOD {
    GET,
    POST,
    OPTIONS,
    HEAD,
    PUT,
    DELETE,
    TRACE,
    CONNECT,
    PATCH
}NET_REQUEST_METHOD;

/**
 * NET RESPONSE
 * THIS FRAME IS SUPPORT NEXT DATA TYPE
 */
typedef enum _NET_RESPONSE_DATA_TYPE {
    JSON,
    STRING,
    NSDATA,
    NSDICTIONARY,
    NSARRAY
}NET_RESPONSE_DATA_TYPE;

#endif /* NetMacro_h */
