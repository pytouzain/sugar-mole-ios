//
//  NavigationControllerDelegate.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 20/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "HomeAnimator.h"

#import "HomeViewController.h"

@interface NavigationControllerDelegate ()

@property (nonatomic, weak) IBOutlet UINavigationController *navigationController;
@property (nonatomic, strong) HomeAnimator *homeAnimator;

@end

@implementation NavigationControllerDelegate

- (void)awakeFromNib {
    self.homeAnimator = [HomeAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if ([fromVC isKindOfClass:[HomeViewController class]] && operation == UINavigationControllerOperationPush) {
        return self.homeAnimator;
    }
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return nil;
}

@end
