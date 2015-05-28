//
//  Device.h
//  Sugar Mole
//
//  Created by Pierre-Yves Touzain on 27/05/2015.
//  Copyright (c) 2015 Pierre-Yves Touzain. All rights reserved.
//

#import "RLMObject.h"
#import "RLMArray.h"

#import "Data.h"
#import "Description.h"

@interface Device : RLMObject

@property int type;
@property RLMArray<Data> *data;
@property NSString *name;
@property RLMArray<Description> *desc;

@end
