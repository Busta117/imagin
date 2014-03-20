//
//  IPProductListCategoriesViewController.h
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IPProductListCategoriesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


+ (id) categoriesView;

@end
