//
//  CustomViewCell.h
//  Quiz6
//
//  Created by Estudiantes on 12/3/16.
//  Copyright © 2016 Cenfotec. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;
@interface CustomViewCell : UITableViewCell
-(void)setupCellWithPerson:(Person*)person;
@end
