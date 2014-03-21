//
//  IPHTTPRequestOperationManager.h
//  SeekIt
//
//  Created by Santiago Bustamante on 10/30/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>


#define URL_BASE @"http://192.237.180.31/archies/public/"

@interface IPHTTPRequestOperationManager : AFHTTPRequestOperationManager

+ (IPHTTPRequestOperationManager *)sharedManager;

@end
