//
//  IPCategoryEntity.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import "IPCategoryEntity.h"

@implementation IPCategoryEntity

+ (id) categoryFromDictionary:(NSDictionary *)dic{
    
    IPCategoryEntity *entity = [[IPCategoryEntity alloc] init];
    entity.categoryId = dic[@"id"];
    entity.name = dic[@"name"];
    entity.imgPath = dic[@"img_path"];
    entity.typeId = [dic[@"type_id"] intValue];
    entity.enabled = [dic[@"enabled"] boolValue];

    NSArray *subCatArr = dic[@"subcategory"];
    NSMutableArray *subCatEntities = [NSMutableArray arrayWithCapacity:0];
    if (subCatArr) {
        [subCatArr enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            IPSubcategoryEntity *subcategory = [IPSubcategoryEntity subcategoriaFromDictionary:obj];
            [subCatEntities addObject:subcategory];
        }];
    }
    entity.subcategories = subCatEntities;
    
    return entity;
    
}
    
    

@end
