// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Category.h instead.

@import CoreData;

extern const struct CategoryAttributes {
	__unsafe_unretained NSString *categoryTitle;
	__unsafe_unretained NSString *imageName;
} CategoryAttributes;

extern const struct CategoryRelationships {
	__unsafe_unretained NSString *news;
} CategoryRelationships;

@class News;

@interface CategoryID : NSManagedObjectID {}
@end

@interface _Category : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CategoryID* objectID;

@property (nonatomic, strong) NSString* categoryTitle;

//- (BOOL)validateCategoryTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* imageName;

//- (BOOL)validateImageName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *news;

- (NSMutableSet*)newsSet;

@end

@interface _Category (NewsCoreDataGeneratedAccessors)
- (void)addNews:(NSSet*)value_;
- (void)removeNews:(NSSet*)value_;
- (void)addNewsObject:(News*)value_;
- (void)removeNewsObject:(News*)value_;

@end

@interface _Category (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCategoryTitle;
- (void)setPrimitiveCategoryTitle:(NSString*)value;

- (NSString*)primitiveImageName;
- (void)setPrimitiveImageName:(NSString*)value;

- (NSMutableSet*)primitiveNews;
- (void)setPrimitiveNews:(NSMutableSet*)value;

@end
