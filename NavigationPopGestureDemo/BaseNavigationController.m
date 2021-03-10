//
//  BaseNavigationController.m
//  InterviewDemo
//
//  Created by CQJ on 2021/3/10.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        // If viewController is rootViewController, disable the pop gesture recognizer.
        self.interactivePopGestureRecognizer.enabled = self.viewControllers.count > 1;
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController.transitionCoordinator notifyWhenInteractionChangesUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        if (context.isCancelled) return;
        [self postPopGestureNotification];
    }];
}

- (void)postPopGestureNotification
{
    NSMutableSet *notificationNames = [NSMutableSet setWithObjects:
                                       @"FirstViewController",
                                       @"SecondViewController", nil];
   
    NSMutableSet *vcNames = [NSMutableSet set];
    for (UIViewController *vc in self.viewControllers) {
        [vcNames addObject:NSStringFromClass([vc class])];
    }
    
    [notificationNames minusSet:vcNames];

    [notificationNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        [[NSNotificationCenter defaultCenter] postNotificationName:obj object:nil];
    }];
}

@end
