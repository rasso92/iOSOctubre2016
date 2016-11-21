
//
//  Created by estudiante on 11/19/16.
//  Copyright © 2016 estudiante. All rights reserved.
//

#import "FibonacciNumber.h"


@interface FibonacciNumber()
@property(nonatomic, assign) int number;
@end
@implementation FibonacciNumber

-(id)initWithNumber:(int)number{
    if (self = [super init]) {
        _number = number;
    }
    return self;
}

@end
