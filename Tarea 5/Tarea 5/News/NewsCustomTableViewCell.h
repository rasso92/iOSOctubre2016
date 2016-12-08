//
//  NewsCustomTableViewCell.h
//  News
//
//  Created by Cesar Brenes on 11/19/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsCustomTableViewCell : UITableViewCell
-(void)configureCellWithNews:(News*)newsObject;
@end
