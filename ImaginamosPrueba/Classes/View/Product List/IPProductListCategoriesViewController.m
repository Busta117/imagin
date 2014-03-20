//
//  IPProductListCategoriesViewController.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import "IPProductListCategoriesViewController.h"
#import <SVProgressHUD.h>

@interface IPProductListCategoriesViewController ()

@end

@implementation IPProductListCategoriesViewController


+ (id) categoriesView{
    IPProductListCategoriesViewController *instance = [[IPProductListCategoriesViewController alloc] initWithNibName:@"IPProductListCategoriesViewController" bundle:nil];
    
    return instance;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Categories";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
