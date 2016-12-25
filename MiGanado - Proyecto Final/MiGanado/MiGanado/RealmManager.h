//
//  RealmManager.h
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 20/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@interface RealmManager : NSObject
+(RLMResults*)getAllAcciones;
+(RLMResults*)getAllAnimals;
+(RLMResults*)getAllGanado;
+(void)createAccionWithName:(NSString*)accionName nextAccionName:(NSString*)nextAccionName FrequencyInDays:(NSNumber*)FrequencyInDays;
+(void)createAnimalWithName:(NSString*)AnimalName;
+(void)createGanadoWithName:(NSString*)ganadoName ganadoBirth:(NSDate*)ganadoBirth ganadoGender:(NSString*)ganadoGender ganadoWeight:(NSNumber*)ganadoWeight animalName:(NSString*) animalName;

@end
