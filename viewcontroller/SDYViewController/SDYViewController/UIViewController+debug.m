//
//  UIViewController+debug.m
//  SDYViewController
//
//  Created by Keith on 16/4/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIViewController+debug.h"
#import <objc/runtime.h>

@implementation UIViewController (debug)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        Method viewDidLoad = class_getInstanceMethod(class, @selector(viewDidLoad));
        Method viewDidLoaded = class_getInstanceMethod(class, @selector(viewloaded));
        BOOL didAddMethod = class_addMethod(class,@selector(viewDidLoad),  method_getImplementation(viewDidLoaded), method_getTypeEncoding(viewDidLoaded));
        if(didAddMethod) {
            class_replaceMethod(class, @selector(viewloaded), method_getImplementation(viewDidLoad), method_getTypeEncoding(viewDidLoad));
        } else {
            method_exchangeImplementations(viewDidLoad, viewDidLoaded);
        }
    });
}

- (void)viewloaded {
    [self viewloaded];//该方法经过了交换 所以实际执行是 viewdidload
    NSLog(@"view did load");
}
//+ (void)load {
//    NSString *className = NSStringFromClass(self.class);
//    NSLog(@"classname %@", className);
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        
//        // When swizzling a class method, use the following:
//        // Class class = object_getClass((id)self);
//        
//        SEL originalSelector = @selector(viewWillAppear:);
//        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
//        
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        
//        BOOL didAddMethod =
//        class_addMethod(class,
//                        originalSelector,
//                        method_getImplementation(swizzledMethod),
//                        method_getTypeEncoding(swizzledMethod));
//        
//        if (didAddMethod) {
//            class_replaceMethod(class,
//                                swizzledSelector,
//                                method_getImplementation(originalMethod),
//                                method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//    });
//}
//
//
//#pragma mark - Method Swizzling
//
//- (void)xxx_viewWillAppear:(BOOL)animated {
//    NSLog(@"viewWillAppear: %@", self);
//    [self xxx_viewWillAppear:animated];
//}
@end
