//
//  IPProductListCategoriesHeaderView.h
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/20/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IPProductListCategoriesHeaderView : UITableViewHeaderFooterView
{
    
    __weak IBOutlet UIView *titleBackground_;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *BackgroundImageView;

@end
