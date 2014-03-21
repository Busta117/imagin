//
//  IPProductListItemsViewController.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/20/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import "IPProductListItemsViewController.h"
#import "IPProductListItemsCell.h"
#import <UIKit+AFNetworking.h>
#import <SVProgressHUD.h>

@interface IPProductListItemsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IPSubcategoryEntity *subcategory;

@end

@implementation IPProductListItemsViewController

+ (id) itemListWithSubcategory:(IPSubcategoryEntity *)subcategory{
    IPProductListItemsViewController *instance = [[IPProductListItemsViewController alloc] initWithNibName:@"IPProductListItemsViewController" bundle:nil];
    instance.subcategory = subcategory;
    return instance;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.subcategory.name;
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [IPCategoriesModel itemsWithSubcategory:self.subcategory complete:^(IPSubcategoryEntity *newSubcategory, NSError *error) {
        [SVProgressHUD dismiss];
        if (newSubcategory && !error) {
            self.subcategory = newSubcategory;
            [self.tableView reloadData];
        }else{
            showAlert(@"Revise su conexión a internet e intente nuevamente", @"", @"OK");
        }
        
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IPProductListItemsCell" bundle:nil] forCellReuseIdentifier:@"IPProductListItemsCell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.subcategory.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IPProductListItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IPProductListItemsCell"];
    
    IPProductEntity *product = self.subcategory.products[indexPath.row];
    
    cell.titleLabel.text = product.name;
    
    NSString *imgPath = product.imgPath;
    if (imgPath) {
        [cell.itemImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_BASE,imgPath]]];
    }else{
        [cell.itemImageView setImage:[UIImage new]];
    }
    cell.descriptionLabel.text = product.description;
    
    
    return cell;
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
    self.subcategory = nil;
}

@end
