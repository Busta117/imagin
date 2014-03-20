//
//  SBUtils.m
//  MedellinHipHop
//
//  Created by Santiago Bustamante on 8/15/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import "SBUtils.h"

@implementation SBUtils


+(NSString *)removeTabsAndBreaksFromString:(NSString *)str{

    NSString *retVal = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    retVal = [retVal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return retVal;
}


+(BOOL)isValidEmail:(NSString *)checkString {
    
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

+(UIBarButtonItem *) customBackButtonWithTarget:(id)target andAction:(SEL)action{
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *btnImage = [UIImage imageNamed:@"navigation_back_arrow.png"];
    [button setImage:btnImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, btnImage.size.width, btnImage.size.height);
    
    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barbtn;
    
}

+ (void) setBackButtonOver:(UIViewController *)viewCon withTarget:(id)target andAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *btnImage = [UIImage imageNamed:@"btn_back.png"];
    [button setImage:btnImage forState:UIControlStateNormal];
    //    [button setTitle:NSLocalizedString(@"Back", nil) forState:UIControlStateNormal];
    //    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.tag = 200;
    button.frame = CGRectMake(0, 0, 100, 44);
    [button sizeToFit];
    
    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    viewCon.navigationItem.leftBarButtonItem = barbtn;
}


+(UIBarButtonItem *) customMenuButtonWithTarget:(id)target andAction:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *btnImage = [UIImage imageNamed:@"btn_menu.png"];
    [button setImage:btnImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, btnImage.size.width, btnImage.size.height);
    
    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barbtn;
    
}

+(UIBarButtonItem *) customSearchButtonWithTarget:(id)target andAction:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *btnImage = [UIImage imageNamed:@"btn_lupa.png"];
    [button setImage:btnImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, btnImage.size.width, btnImage.size.height);
    
    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barbtn;
    
}
+(UIBarButtonItem *) customAddFriendsButtonWithTarget:(id)target andAction:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIImage *btnImage = [UIImage imageNamed:@"btn_addfriends.png"];
    [button setImage:btnImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, btnImage.size.width, btnImage.size.height);
    
    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barbtn;
    
}



+(NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    return [formatter stringFromDate:date];
}

+(NSDate *)dateFromString:(NSString*)string withFormat:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSDate *capturedStartDate = [dateFormatter dateFromString: string];
    return capturedStartDate;
}

+ (void)addChildViewController:(UIViewController *)childViewController withParent:(UIViewController *)parent {
    [parent addChildViewController:childViewController];
    [parent.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:parent];
}

+ (void)removeChildViewController:(UIViewController *)childViewController{
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

+ (float) getAccuracy: (NSString *)description {
    NSString *descr = description;
    NSArray *dict = [descr componentsSeparatedByString:@"(speed"];
    NSString *part1 = [dict objectAtIndex:0];
    NSArray *dict2 = [part1 componentsSeparatedByString:@"+/-"];
    NSString * accuracy = [dict2 objectAtIndex:1];
    accuracy = [accuracy stringByReplacingOccurrencesOfString:@" " withString:@""];
    accuracy = [accuracy stringByReplacingOccurrencesOfString:@"m" withString:@""];
    return [accuracy floatValue];
}

@end
