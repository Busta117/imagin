//
//  IPProductListCategoriesViewController.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/21/14.
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
    IPProductListCategoriesViewController *instance = [[IPProductListCategoriesViewController alloc] initWithStyle:UITableViewStylePlain];
    
    return instance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Categorias";
    self.categories = @[];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IPProductListCategoriesCell" bundle:nil] forCellReuseIdentifier:@"IPProductListCategoriesCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IPProductListCategoriesHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"IPProductListCategoriesHeaderView"];
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [self loadCategories];
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(loadCategories) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    

}

- (void) loadCategories{
    [IPCategoriesModel categoriesWithComplete:^(NSArray *categories, NSError *error) {
        [SVProgressHUD dismiss];
        [self.refreshControl endRefreshing];
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


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    IPProductListCategoriesHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"IPProductListCategoriesHeaderView"];
    header.titleLabel.text = [self.categories[section] name];
    NSString *imgPath = [self.categories[section] imgPath];
    
    [header.BackgroundImageView setImage:[UIImage new]];
    header.BackgroundImageView.backgroundColor = [UIColor lightGrayColor];
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
    }
    //Clean rest of resources here eg:arrays, maps, dictionaries, etc
    self.categories = nil;
}


@end
