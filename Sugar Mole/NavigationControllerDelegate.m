//
//  NavigationControllerDelegate.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 20/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "HomePushAnimator.h"
#import "HomePopAnimator.h"

#import "HomeViewController.h"

@interface NavigationControllerDelegate ()

@property (nonatomic, weak) IBOutlet UINavigationController *navigationController;
@property (nonatomic, strong) HomePushAnimator *homePushAnimator;
@property (nonatomic, strong) HomePopAnimator *homePopAnimator;

@end

@implementation NavigationControllerDelegate

- (void)awakeFromNib {
    self.homePushAnimator = [HomePushAnimator new];
    self.homePopAnimator = [HomePopAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if ([fromVC isKindOfClass:[HomeViewController class]] && operation == UINavigationControllerOperationPush) {
        return self.homePushAnimator;
    }
    else if ([toVC isKindOfClass:[HomeViewController class]] && operation == UINavigationControllerOperationPop) {
        return self.homePopAnimator;
    }
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return nil;
}

@end
