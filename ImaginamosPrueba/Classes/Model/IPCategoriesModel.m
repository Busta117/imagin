//
//  IPCategoriesModel.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import "IPCategoriesModel.h"

@implementation IPCategoriesModel


+ (void)categoriesWithComplete:(void(^)(NSArray *categories, NSError *error))block {
    
    IPHTTPRequestOperationManager *manager = [IPHTTPRequestOperationManager sharedManager];
    
    [manager GET:@"category" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *categories = [NSMutableArray arrayWithCapacity:0];
        
        NSArray *objs = responseObject;
        [objs enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            IPCategoryEntity *category = [IPCategoryEntity categoryFromDictionary:obj];
            [categories addObject:category];
        }];
        
        if (block) {
            block(categories,nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
}


+ (void)itemsWithSubcategory:(IPSubcategoryEntity *)subcategory complete:(void(^)(IPSubcategoryEntity *newSubcategory, NSError *error))block {
    
    IPHTTPRequestOperationManager *manager = [IPHTTPRequestOperationManager sharedManager];
    
    NSString *path = [NSString stringWithFormat:@"category/details/%@",subcategory.categoryId];
    
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *subcategories = responseObject[@"subcategory"];
        
        NSMutableArray *subcats = [NSMutableArray arrayWithCapacity:0];
        
        [subcategories enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            IPSubcategoryEntity *subCat = [IPSubcategoryEntity subcategoriaFromDictionary:obj];
            [subcats addObject:subCat];
        }];
        
        __block IPSubcategoryEntity *subCate = nil;
        
        [subcats enumerateObjectsUsingBlock:^(IPSubcategoryEntity *subObj, NSUInteger idx, BOOL *stop) {
            if ([subObj.subcategoryId intValue] == [subcategory.subcategoryId intValue]) {
                subCate = subObj;
                *stop = YES;
            }
        }];
        
        
        if (block) {
            block(subCate,nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(nil,error);
        }
    }];
}




@end
