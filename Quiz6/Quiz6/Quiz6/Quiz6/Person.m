//
//  Persona.m
//  Quiz6
//
//  Created by Estudiantes on 12/3/16.
//  Copyright © 2016 Cenfotec. All rights reserved.
//

#import "Person.h"
@interface Person()
@property(nonatomic, assign) int order;
@property(strong, nonatomic) NSString* name;
@end
@implementation Person

-(id)initWithPerson:(int)order name:(NSString*)name{
    if (self = [super init]) {
        _order = order;
        _name = name;
    }
    return self;
}
@end

