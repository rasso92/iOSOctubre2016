
//
//  Created by estudiante on 11/19/16.
//  Copyright © 2016 estudiante. All rights reserved.
//

#import "ColorNumber.h"


@interface ColorNumber()
@property(nonatomic, assign) int number;
@end
@implementation ColorNumber

-(id)initWithNumber:(int)number{
    if (self = [super init]) {
        _number = number;
    }
    return self;
}

@end
