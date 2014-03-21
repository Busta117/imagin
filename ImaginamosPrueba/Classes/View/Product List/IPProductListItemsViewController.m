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
#import <UIAlertView+Blocks.h>
#import <CoreText/CoreText.h>

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
    self.title = [self.subcategory.name capitalizedString];

    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    [IPCategoriesModel itemsWithSubcategory:self.subcategory complete:^(IPSubcategoryEntity *newSubcategory, NSError *error) {
        [SVProgressHUD dismiss];
        if (newSubcategory && !error) {
            if (newSubcategory.products.count == 0) {
                [UIAlertView showWithTitle:@"No hay elementos en esta categoria" message:@"" cancelButtonTitle:@"Ok" otherButtonTitles:nil tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                    [self.navigationController popViewControllerAnimated:YES];
                }];
                return;
            }
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

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IPProductEntity *product = self.subcategory.products[indexPath.row];

    CGSize size;
    
    if (SYSTEM_VERSION_GREATER_THAN(@"6.9")) {
        
        size = [product.description sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:14.0f]}];
        
    }else{
        size = [product.description sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:14.0f]];
    }
    
    return (size.width*0.12) + 130;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IPProductListItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IPProductListItemsCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IPProductEntity *product = self.subcategory.products[indexPath.row];
    
    cell.titleLabel.text = product.name;
    
    NSString *imgPath = product.imgPath;
    [cell.itemImageView setImage:[UIImage new]];
    if (imgPath) {
        [cell.itemImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",URL_BASE,imgPath]]];
    }else{
        [cell.itemImageView setImage:[UIImage new]];
    }
    
    float w = CGRectGetWidth(cell.descriptionLabel.frame);
    
    cell.descriptionLabel.text = product.description;
    [cell.descriptionLabel sizeToFit];
    CGPoint center = cell.descriptionLabel.center;
    center.x = cell.center.x;
    cell.descriptionLabel.center = center;
    
    CGRect frame = cell.descriptionLabel.frame;
    frame.size.width = w;
    cell.descriptionLabel.frame = frame;
    
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
