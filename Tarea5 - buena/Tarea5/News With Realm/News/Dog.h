

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Dog : RLMObject
@property NSString *name;
@property NSString *imageDog;
@property NSString *color;

@end
RLM_ARRAY_TYPE(Category)
