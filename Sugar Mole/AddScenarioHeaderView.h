//
//  AddScenarioHeaderView.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 23/06/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddScenarioHeaderViewProtocol <NSObject>

- (void)addButtonTouchedForTag:(NSUInteger)tag;

@end

@interface AddScenarioHeaderView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *titleBarColor;
@property (nonatomic, assign) NSUInteger headerViewTag;

@property (nonatomic, assign) id<AddScenarioHeaderViewProtocol> delegate;

@end
