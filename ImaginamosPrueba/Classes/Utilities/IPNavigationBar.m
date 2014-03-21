//
//  IPNavigationBar.m
//
//
//  Created by Santiago Bustamante on 03/19/14.
//  Copyright (c) 2014 Busta117. All rights reserved.
//

#import "IPNavigationBar.h"

@implementation IPNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (SYSTEM_VERSION_GREATER_THAN(@"6.9")) {
            [self setBarTintColor:[UIColor colorWithWhite:0.9 alpha:1]];
            [self setTintColor:[UIColor whiteColor]];
            [self setBarStyle:UIBarStyleDefault];
            [self setTranslucent:NO];
        }else{
            
            [self setBarStyle:UIBarStyleBlack];
            [self setTintColor:[UIColor whiteColor]];
            [self setShadowImage:[[UIImage alloc] init]];
            [self setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
            [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
            
            [[UIToolbar appearance] setTintColor:[UIColor whiteColor]];
            [[UIToolbar appearance] setBackgroundColor:[UIColor whiteColor]];
            [[UIToolbar appearance] setShadowImage:[[UIImage alloc] init] forToolbarPosition:UIBarPositionAny];
            [[UIToolbar appearance] setBackgroundImage:[[UIImage alloc] init] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            
        }
        
        [self setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor colorWithWhite:0.3 alpha:1], UITextAttributeTextColor,
          [UIColor clearColor], UITextAttributeTextShadowColor,
          [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0], UITextAttributeFont, nil]];
        
    }
    return self;
}

- (UINavigationItem *)popNavigationItemAnimated:(BOOL)animated{
    return [super popNavigationItemAnimated:animated];
}

@end
