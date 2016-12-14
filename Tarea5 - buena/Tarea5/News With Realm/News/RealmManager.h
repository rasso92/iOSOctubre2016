

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RealmManager : NSObject
+(RLMResults*)getAllDogs;
+(void)createDogswithName:(NSString*)name color:(NSString*)color;
@end
