

#import "RealmManager.h"
#import "Dog.h"

#define DOG_NAME_KEY @"DOG_NAME_KEY"
#define DOG_IMAGE_NAME_KEY @"DOG_IMAGE_NAME_KEY"
#define DOG_COLOR_KEY @"DOG_COLOR_KEY"

@implementation RealmManager


+(RLMResults*)getAllDogs{
    if ([self needsToInsertDogs]) {
        [self createDefaultCategories];
    }
    return [Dog allObjects];
}

+(BOOL)needsToInsertDogs{
    RLMResults<Dog *> *dogs = [Dog allObjects]; // retrieves all Categories from the default Realm
    if (dogs.count==0) {
        return true;
    }
    return false;
}


+(NSArray*)createDogsDictionary{
    return [[NSArray alloc] initWithObjects:
            @{DOG_NAME_KEY:@"Capitan", DOG_IMAGE_NAME_KEY:@"capitan", DOG_COLOR_KEY:@"Cafe"},
            @{DOG_NAME_KEY:@"Lobito", DOG_IMAGE_NAME_KEY:@"lobito", DOG_COLOR_KEY:@"Gris"},
            @{DOG_NAME_KEY:@"Ojotes", DOG_IMAGE_NAME_KEY:@"ojotes", DOG_COLOR_KEY:@"Blanco"},
            @{DOG_NAME_KEY:@"Princeso", DOG_IMAGE_NAME_KEY:@"princeso", DOG_COLOR_KEY:@"Cafe"},
            @{DOG_NAME_KEY:@"Scooby", DOG_IMAGE_NAME_KEY:@"scooby", DOG_COLOR_KEY:@"Cafe"},
            @{DOG_NAME_KEY:@"Zaguate", DOG_IMAGE_NAME_KEY:@"zaguate", DOG_COLOR_KEY:@"Manchado"},
            @{DOG_NAME_KEY:@"Chata", DOG_IMAGE_NAME_KEY:@"chata", DOG_COLOR_KEY:@"Negro"},
            @{DOG_NAME_KEY:@"Pancho", DOG_IMAGE_NAME_KEY:@"pancho", DOG_COLOR_KEY:@"Dorado"},
            @{DOG_NAME_KEY:@"Jocote", DOG_IMAGE_NAME_KEY:@"jocote", DOG_COLOR_KEY:@"Bicolor"},
            @{DOG_NAME_KEY:@"Boston", DOG_IMAGE_NAME_KEY:@"boston", DOG_COLOR_KEY:@"BlancoYNegro"},
            nil];
    
}

+(void)createDefaultCategories{
    NSArray *dogsArray = [self createDogsDictionary];
    for (NSDictionary *dogDictionary in dogsArray) {
        Dog *dog = [Dog new];
        dog.color = [dogDictionary valueForKey:DOG_COLOR_KEY];
        dog.name = [dogDictionary   valueForKey:DOG_NAME_KEY];
        dog.imageDog = [dogDictionary valueForKey:DOG_IMAGE_NAME_KEY];
        [self insertObjectInDB:dog];
    }
}


+(void)insertObjectInDB:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}




+(void)createDogswithName:(NSString*)name color:(NSString*)color{
    Dog *dog = [Dog new];
    dog.color = color;
    dog.imageDog = [self obtieneImagenRandom];
    dog.name = name;
    [self insertObjectInDB:dog];

}

+(NSString*) obtieneImagenRandom{
    int num = arc4random_uniform(9);
    NSString* retorno;
    int contador = 0; /*Esto esta muy feo - lo debo corrregir cuando tenga tiempo*/
    NSArray *dogsArray = [self createDogsDictionary];
    for (NSDictionary *dogDictionary in dogsArray) {
        contador +=1;
        if(contador == num){
            retorno = [dogDictionary valueForKey:DOG_IMAGE_NAME_KEY];
        }
    }

    return retorno;
}


@end
