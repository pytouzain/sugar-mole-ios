//
//  NavigationControllerDelegate.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 20/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "NavigationControllerDelegate.h"

@interface NavigationControllerDelegate ()

@property (nonatomic, weak) IBOutlet UINavigationController *navigationController;

@end

@implementation NavigationControllerDelegate

- (void)awakeFromNib {
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return nil;
}

@end
