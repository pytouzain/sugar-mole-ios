//
//  HomeAnimator.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 21/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "HomePushAnimator.h"
#import "HomeViewController.h"

@interface HomePushAnimator ()

@property NSMutableArray *views;

@end

@implementation HomePushAnimator

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
    HomeViewController* fromViewController = (HomeViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [_views addObject:fromViewController.decorationView];
    [_views addObject:fromViewController.myScenariosButton];
    [_views addObject:fromViewController.actionsButton];
    [_views addObject:fromViewController.compatibilityButton];
    [_views addObject:fromViewController.settingsButton];
    [_views addObject:fromViewController.vocalControlButton];
    
    CGRect touchedButtonFrame = fromViewController.touchedButton.frame;
    toViewController.view.alpha = 0.f;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        NSUInteger indexDown = 0;
        NSUInteger indexUp = 0;
        
        for (NSInteger i = [_views indexOfObject:fromViewController.touchedButton] ; i >= 0 ; i--) {
            UIView *view = (UIView *)[_views objectAtIndex:i];
            CGRect frame = view.frame;
            frame.origin.y = touchedButtonFrame.size.height - indexUp - frame.size.height;
            view.frame = frame;
            indexUp += view.frame.size.height + 2;
        }
        
        for (NSInteger i = ([_views indexOfObject:fromViewController.touchedButton] + 1) ; i < [_views count] ; i++) {
            UIView *view = (UIView *)[_views objectAtIndex:i];
            CGRect frame = view.frame;
            frame.origin.y = fromViewController.view.frame.size.height + indexDown;
            view.frame = frame;
            indexDown += view.frame.size.height + 2;
        }
    } completion:^(BOOL finished) {
        toViewController.view.alpha = 1.f;
        [_views removeAllObjects];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
