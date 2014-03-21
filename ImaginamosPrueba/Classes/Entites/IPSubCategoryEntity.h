//
//  IPSubCategoryEntity.h
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPProductEntity.h"

@interface IPSubcategoryEntity : NSObject

@property (nonatomic, strong) NSString *subcategoryId;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, assign) BOOL additionEnable;
@property (nonatomic, strong) NSMutableArray *products;

+ (id) subcategoriaFromDictionary:(NSDictionary *)dic;

@end
