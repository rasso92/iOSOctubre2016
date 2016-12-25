//
//  Accion.h
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 20/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Accion : RLMObject
@property NSString *accionName;
@property NSNumber<RLMInt> *FrequencyInDays;
@property NSString *nextAccionName;
@end
RLM_ARRAY_TYPE(Accion)
