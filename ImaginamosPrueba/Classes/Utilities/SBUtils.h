//
//  SBUtils.h
//  MedellinHipHop
//
//  Created by Santiago Bustamante on 8/15/13.
//  Copyright (c) 2013 Busta. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IS_IPAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_IPAD_RETINA (IS_IPAD && [[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))
#define IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && ([[UIScreen mainScreen] bounds].size.height > 480.0))

#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define showAlert(Title, Message, CancelButton) UIAlertView * alert = [[UIAlertView alloc] initWithTitle:Title message:Message delegate:nil cancelButtonTitle:CancelButton otherButtonTitles:nil, nil]; \
[alert show];

#define JSON(json_data) json_data ? [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:nil] : nil

//Make Error
static inline NSError * sb_error (NSString * domain, int domainCode, NSString * description) {
    NSMutableDictionary * errorDetail = [NSMutableDictionary dictionary];
    [errorDetail setValue:description forKey:NSLocalizedDescriptionKey];
    NSError * error = [NSError errorWithDomain:domain code:domainCode userInfo:errorDetail];
    return error;
}

#define KAPP_BLUE [UIColor colorWithRed:0.0/255.0 green:174.0/255.0 blue:239.0/255.0 alpha:1]

@interface SBUtils : NSObject

+(NSString *)removeTabsAndBreaksFromString:(NSString *)str;
+(BOOL)isValidEmail:(NSString *)checkString;
+(UIBarButtonItem *) customBackButtonWithTarget:(id)target andAction:(SEL)action;
+(UIBarButtonItem *) customMenuButtonWithTarget:(id)target andAction:(SEL)action;
+(UIBarButtonItem *) customSearchButtonWithTarget:(id)target andAction:(SEL)action;
+(UIBarButtonItem *) customAddFriendsButtonWithTarget:(id)target andAction:(SEL)action;
+ (void) setBackButtonOver:(UIViewController *)viewCon withTarget:(id)target andAction:(SEL)action;
+(NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;
+(NSDate *)dateFromString:(NSString*)string withFormat:(NSString *)format;
+ (void)addChildViewController:(UIViewController *)childViewController withParent:(UIViewController *)parent ;
+ (void)removeChildViewController:(UIViewController *)childViewController;
+ (float) getAccuracy: (NSString *)description;

@end
