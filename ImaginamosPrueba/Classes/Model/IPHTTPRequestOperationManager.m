//
//  IPHTTPRequestOperationManager.m
//  SeekIt
//
//  Created by Santiago Bustamante on 10/30/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import "IPHTTPRequestOperationManager.h"


@implementation IPHTTPRequestOperationManager


+ (IPHTTPRequestOperationManager *)sharedManager {
    static IPHTTPRequestOperationManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[IPHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:URL_BASE]];
    });
    
    return _sharedManager;
}



@end
