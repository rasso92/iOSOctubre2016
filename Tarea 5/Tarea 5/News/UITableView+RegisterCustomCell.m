//
//  UITableView+RegisterCustomCell.m
//  News
//
//  Created by Cesar Brenes on 11/19/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import "UITableView+RegisterCustomCell.h"

@implementation UITableView (RegisterCustomCell)


-(void)registerCellWithIdentifier:(NSString*)identifier{
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

@end
