//
//  IPProductEntity.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import "IPProductEntity.h"

@implementation IPProductEntity

+ (id) productFromDictionary:(NSDictionary *)dic{
    
    IPProductEntity *entity = [[IPProductEntity alloc] init];
    entity.productId = dic[@"id"];
    entity.name = dic[@"name"];
    entity.description = dic[@"description"];
    entity.imgPath = dic[@"img_path"];
    entity.enabled = [dic[@"enabled"] boolValue];

    return entity;
    
}


@end
