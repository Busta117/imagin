//
//  IPCategoriesModel.h
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPHTTPRequestOperationManager.h"
#import "IPCategoryEntity.h"

@interface IPCategoriesModel : NSObject


+ (void)categoriesWithComplete:(void(^)(NSArray *categories, NSError *error))block;
+ (void)itemsWithSubcategory:(IPSubcategoryEntity *)subcategory complete:(void(^)(IPSubcategoryEntity *newSubcategory, NSError *error))block;

@end
