//
//  CategoryCustomTableViewCell.h
//  News
//
//  Created by Cesar Brenes on 11/12/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Category;
@interface CategoryCustomTableViewCell : UITableViewCell
-(void)setupCellWithCategoryObject:(Category*)category;
@end
