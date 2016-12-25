//
//  RealmManager.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 20/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//
#import "Accion.h"
#import "Animal.h"
#import "Eventos.h"
#import "Ganado.h"
#import "RealmManager.h"
#define ANIMAL_NAME_KEY @"ANIMAL_NAME_KEY"
#define ACCION_NAME_KEY @"ACCION_NAME_KEY"
#define ACCION_FREQUENCY_IN_DAYS_KEY @"ACCION_FREQUENCY_IN_DAYS_KEY"
#define ACCION_NEXT_NAME_KEY @"ACCION_NEXT_NAME_KEY"
@implementation RealmManager


+(RLMResults*)getAllAnimals{
    if ([self needsToInsertAnimals]) {
        [self createDefaultAnimals];
    }
    return [Animal allObjects];
}

+(RLMResults*)getAllAcciones{
    if ([self needsToInsertAcciones]) {
        [self createDefaultAcciones];
    }
    return [Accion allObjects];
}

+(RLMResults*)getAllGanado{
    return [Ganado allObjects];
}

+(BOOL)needsToInsertAnimals{
    RLMResults<Animal *> *animals = [Animal allObjects]; // retrieves all Categories from the default Realm
    if (animals.count==0) {
        return true;
    }
    return false;
}
+(BOOL)needsToInsertAcciones{
    RLMResults<Accion *> *acciones = [Accion allObjects]; // retrieves all Categories from the default Realm
    if (acciones.count==0) {
        return true;
    }
    return false;
}


+(NSArray*)createAccionesDictionary{
    return [[NSArray alloc] initWithObjects:
            @{ACCION_NAME_KEY:@"Nacimiento", ACCION_FREQUENCY_IN_DAYS_KEY:@"180",ACCION_NEXT_NAME_KEY:@"Destete"},@{ACCION_NAME_KEY:@"Parto", ACCION_FREQUENCY_IN_DAYS_KEY:@"17",ACCION_NEXT_NAME_KEY:@"Celo"},
            nil];
}
+(NSArray*)createAnimalDictionary{
    return [[NSArray alloc] initWithObjects:
            @{ANIMAL_NAME_KEY:@"Vaca"},@{ANIMAL_NAME_KEY:@"Caballo"},
            nil];
}

+(void)createDefaultAcciones{
    NSArray *accionesArray = [self createAccionesDictionary];
    for (NSDictionary *accionesDictionary in accionesArray) {
        Accion *accion = [Accion new];
        accion.accionName = [accionesDictionary valueForKey:ACCION_NAME_KEY ];
        accion.nextAccionName = [accionesDictionary valueForKey:ACCION_NEXT_NAME_KEY];
        accion.FrequencyInDays = [accionesDictionary valueForKey:ACCION_FREQUENCY_IN_DAYS_KEY];
        [self insertObjectInDB:accion];
    }
}

+(void)createDefaultAnimals{
    NSArray *animalsArray = [self createAnimalDictionary];
    for (NSDictionary *animalsDictionary in animalsArray) {
        Animal *animal = [Animal new];
        animal.animalName = [animalsDictionary valueForKey:ANIMAL_NAME_KEY];
        [self insertObjectInDB:animal];
    }
}

+(void)insertObjectInDB:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

+(void)createAccionWithName:(NSString*)accionName nextAccionName:(NSString*)nextAccionName FrequencyInDays:(NSNumber*)FrequencyInDays{
    Accion *accion = [Accion new];
    accion.accionName = accionName;
    accion.nextAccionName = nextAccionName;
    accion.FrequencyInDays = FrequencyInDays;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:accion];
    [realm commitWriteTransaction];
    
}

+(void)createAnimalWithName:(NSString*)AnimalName{
    Animal *animal = [Animal new];
    animal.animalName = AnimalName;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:animal];
    [realm commitWriteTransaction];
    
}
+(void)createGanadoWithName:(NSString*)ganadoName ganadoBirth:(NSDate*)ganadoBirth ganadoGender:(NSString*)ganadoGender ganadoWeight:(NSNumber*)ganadoWeight animalName:(NSString*) animalName  {
    Ganado *ganado = [Ganado new];
    ganado.animalName = animalName;
    ganado.ganadoWeight = ganadoWeight;
    ganado.ganadoBirthDay = ganadoBirth;
    ganado.ganadoGender = ganadoGender;
    ganado.ganadoName = ganadoName;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:ganado];
    [realm commitWriteTransaction];
    
}

@end
