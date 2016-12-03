//
//  Persona.h
//  Quiz6
//
//  Created by Estudiantes on 12/3/16.
//  Copyright © 2016 Cenfotec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(readonly) int order;
@property(readonly) NSString* name;
-(id)initWithPerson:(int)order name:(NSString*)name;
@end
	
