//
//  HomePopAnimator.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 21/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "HomePopAnimator.h"
#import "HomeViewController.h"

@interface HomePopAnimator ()

@property NSMutableArray *views;

@end

@implementation HomePopAnimator

- (instancetype)init {
    self = [super init];
    if (self) {
        self.views = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    HomeViewController* toViewController = (HomeViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [_views addObject:toViewController.decorationView];
    [_views addObject:toViewController.myScenariosButton];
    [_views addObject:toViewController.actionsButton];
    [_views addObject:toViewController.compatibilityButton];
    [_views addObject:toViewController.settingsButton];
    [_views addObject:toViewController.vocalControlButton];
    
    NSArray *initialFrames = toViewController.initialFrames;
    
    toViewController.view.alpha = 1.f;
    fromViewController.view.alpha = 0.f;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        for (NSUInteger i = 0 ; i < [_views count] && i < [initialFrames count] ; i++) {
            ((UIView *)[_views objectAtIndex:i]).frame = [[initialFrames objectAtIndex:i] CGRectValue];
        }
    } completion:^(BOOL finished) {
        fromViewController.view.alpha = 1.f;
        [_views removeAllObjects];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
