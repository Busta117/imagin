
#import "UIViewController+backButton.h"
#import <objc/runtime.h>


@implementation UIViewController (customView)

//This method tries to add a custom back buttonItem to all viewControllers of the App
-(void)swizzled_viewDidLoad {
    
    //Not a bug, not recursion, just swizzling!
    [self swizzled_viewDidLoad];
    
    if (self.navigationController) {
        
        int index = (int)[self.navigationController.viewControllers indexOfObject:self];
        if (index != 0) {
            UIBarButtonItem * item = [SBUtils customBackButtonWithTarget:self andAction:@selector(back)];
            self.navigationItem.leftBarButtonItem = item;
        }
        
    }
}

//Exchanges implementation for calling both viewDidLoads
+(void)load {
    
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(viewDidLoad));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_viewDidLoad));
    method_exchangeImplementations(original, swizzled);
}

-(void) back {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
