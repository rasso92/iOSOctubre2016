//
//  CoreDataManager.m
//  News
//
//  Created by Cesar Brenes on 12/3/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import "CoreDataManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Category.h"
#import "News.h"

@implementation CoreDataManager


+(NSArray*)getAllCategories{
    
    return nil;
}

+(BOOL)needsToInsertCategories{
    NSArray *categories = [Category MR_findAll];
    if (categories.count==0) {
        return true;
    }
    return false;
}

@end
