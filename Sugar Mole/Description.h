//
//  Description.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 29/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "RLMObject.h"

@interface Description : RLMObject

@property NSString *parameters;
@property NSString *value;

@end

RLM_ARRAY_TYPE(Description)