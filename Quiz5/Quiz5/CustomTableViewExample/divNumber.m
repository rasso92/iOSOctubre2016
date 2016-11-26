
//
//  Created by estudiante on 11/19/16.
//  Copyright © 2016 estudiante. All rights reserved.
//

#import "divNumber.h"


@interface divNumber()
@property(nonatomic, assign) int number;
@end
@implementation divNumber

-(id)initWithNumber:(int)number{
    if (self = [super init]) {
        _number = number;
    }
    return self;
}

@end
