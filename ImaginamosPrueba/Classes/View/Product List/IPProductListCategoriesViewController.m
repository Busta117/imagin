//
//  IPProductListCategoriesViewController.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/19/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import "IPProductListCategoriesViewController.h"
#import <SVProgressHUD.h>
#import "IPCategoriesModel.h"
#import <UIKit+AFNetworking.h>
#import "IPProductListCategoriesCell.h"
#import "IPProductListCategoriesHeaderView.h"
#import "IPProductListItemsViewController.h"

@interface IPProductListCategoriesViewController ()

@property (nonatomic, strong) NSArray *categories;

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
        self.title = @"Categorias";
        self.categories = @[];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IPProductListCategoriesCell" bundle:nil] forCellReuseIdentifier:@"IPProductListCategoriesCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IPProductListCategoriesHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"IPProductListCategoriesHeaderView"];
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [IPCategoriesModel categoriesWithComplete:^(NSArray *categories, NSError *error) {
        [SVProgressHUD dismiss];
        if (categories && !error) {
            self.categories = categories;
            [self.tableView reloadData];
        }else{
            showAlert(@"Revise su conexión a internet e intente nuevamente", @"", @"OK");
        }
        
    }];
    
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.categories[section] subcategories].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.categories[section] name];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    IPProductListCategoriesHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"IPProductListCategoriesHeaderView"];
    header.titleLabel.text = [self.categories[section] name];
    NSString *imgPath = [self.categories[section] imgPath];
    if (imgPath) {
        [header.BackgroundImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_BASE,imgPath]]];
    }

    return header;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    IPProductListCategoriesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IPProductListCategoriesCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.titleLabel.text = [[self.categories[indexPath.section] subcategories][indexPath.row] name];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    IPProductListItemsViewController *items = [IPProductListItemsViewController itemListWithSubcategory:[self.categories[indexPath.section] subcategories][indexPath.row]];
    
    [self.navigationController pushViewController:items animated:YES];
    
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    if ([self isViewLoaded] && self.view.window == nil) {
        self.view = nil;
    }
    if (![self isViewLoaded]) {
        //Clean outlets here
        self.tableView = nil;
    }
    //Clean rest of resources here eg:arrays, maps, dictionaries, etc
    self.categories = nil;
}

@end
