//
//  Eventos.h
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 20/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class Ganado;
@class Accion;
@interface Eventos : RLMObject
@property Ganado* ganado;
@property Accion* accion;
@property NSDate* eventDate;
@property NSNumber<RLMInt>* eventState;
@end
RLM_ARRAY_TYPE(Eventos)
