// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to News.h instead.

@import CoreData;

extern const struct NewsAttributes {
	__unsafe_unretained NSString *newsDate;
	__unsafe_unretained NSString *newsDescription;
	__unsafe_unretained NSString *newsTitle;
} NewsAttributes;

extern const struct NewsRelationships {
	__unsafe_unretained NSString *category;
} NewsRelationships;

@class Category;

@interface NewsID : NSManagedObjectID {}
@end

@interface _News : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) NewsID* objectID;

@property (nonatomic, strong) NSDate* newsDate;

//- (BOOL)validateNewsDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* newsDescription;

//- (BOOL)validateNewsDescription:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* newsTitle;

//- (BOOL)validateNewsTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Category *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;

@end

@interface _News (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveNewsDate;
- (void)setPrimitiveNewsDate:(NSDate*)value;

- (NSString*)primitiveNewsDescription;
- (void)setPrimitiveNewsDescription:(NSString*)value;

- (NSString*)primitiveNewsTitle;
- (void)setPrimitiveNewsTitle:(NSString*)value;

- (Category*)primitiveCategory;
- (void)setPrimitiveCategory:(Category*)value;

@end
