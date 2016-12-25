//
//  Ganado.h
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 20/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class Animal;
@interface Ganado : RLMObject
@property NSString* animalName;
@property NSString *ganadoName;
@property NSString *ganadoGender;
@property NSDate *ganadoBirthDay;
@property NSNumber<RLMInt> *ganadoWeight;
@property NSNumber<RLMInt> *ganadoState;
@end
RLM_ARRAY_TYPE(Ganado)
