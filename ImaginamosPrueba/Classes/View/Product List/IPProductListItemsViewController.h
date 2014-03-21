//
//  IPProductListItemsViewController.h
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/20/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPCategoriesModel.h"

@interface IPProductListItemsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

+ (id) itemListWithSubcategory:(IPSubcategoryEntity *)subcategory;

@end
