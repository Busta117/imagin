//
//  IPProductEntity.h
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPProductEntity : NSObject

@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *imgPath;
@property (nonatomic, assign) BOOL enabled;

+ (id) productFromDictionary:(NSDictionary *)dic;

@end