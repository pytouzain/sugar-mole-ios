//
//  HomeAnimator.m
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 21/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "HomeAnimator.h"
#import "HomeViewController.h"

@interface HomeAnimator ()

@property NSMutableArray *views;

@end

@implementation HomeAnimator

- (instancetype)init {
    self = [super init];
    if (self) {
        self.views = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
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
    toViewController.view.alpha = 0.f;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        BOOL isUp = YES;
        
        for (UIView *view in _views) {
            if (view == fromViewController.touchedButton) {
                CGRect frame = view.frame;
                frame.origin.y = 0;
                view.frame = frame;
                isUp = NO;
            }
            else if (isUp == YES) {
                CGRect frame = view.frame;
                if ([view isKindOfClass:[UIButton class]])
                    frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height - frame.size.height;
                else
                    frame.origin.y = 0 - frame.size.height;
                view.frame = frame;
            }
            else if (isUp == NO) {
                CGRect frame = view.frame;
                frame.origin.y = fromViewController.view.bounds.size.height;
                view.frame = frame;
            }
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
