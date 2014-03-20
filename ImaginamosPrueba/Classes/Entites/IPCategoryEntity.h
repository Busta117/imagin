//
//  IPCategoryEntity.h
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPSubCategoryEntity.h"

@interface IPCategoryEntity : NSObject

@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imgPath;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, strong) NSMutableArray *subcategories;

@end
