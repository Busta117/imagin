//
//  IPProductListCategoriesHeaderView.m
//  ImaginamosPrueba
//
//  Created by Santiago Bustamante on 3/20/14.
//  Copyright (c) 2014 Busta. All rights reserved.
//

#import "IPProductListCategoriesHeaderView.h"
#import <QuartzCore/QuartzCore.h>

@implementation IPProductListCategoriesHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    titleBackground_.layer.cornerRadius = 5;
    titleBackground_.layer.masksToBounds = YES;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//    
//}


@end
