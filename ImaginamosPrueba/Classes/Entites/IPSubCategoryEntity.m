//
//  IPSubCategoryEntity.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import "IPSubcategoryEntity.h"

@implementation IPSubcategoryEntity

+ (id) subcategoriaFromDictionary:(NSDictionary *)dic{
    IPSubcategoryEntity *entity = [[IPSubcategoryEntity alloc] init];
    
    entity.subcategoryId = dic[@"id"];
    entity.categoryId = dic[@"category_id"];
    entity.name = dic[@"name"];
    entity.enabled = [dic[@"enabled"] boolValue];
    entity.additionEnable = [dic[@"addition_enable"] boolValue];
    
    NSArray *items = dic[@"items"];
    NSMutableArray *prods = [NSMutableArray arrayWithCapacity:0];
    
    if (items) {
        [items enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            IPProductEntity *product = [IPProductEntity productFromDictionary:obj];
            [prods addObject:product];
        }];
    }
    
    entity.products = prods;
    
    
    return entity;
}


@end
