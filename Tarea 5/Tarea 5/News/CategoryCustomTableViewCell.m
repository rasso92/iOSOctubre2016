//
//  CategoryCustomTableViewCell.m
//  News
//
//  Created by Cesar Brenes on 11/12/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import "CategoryCustomTableViewCell.h"
#import "Category.h"

@interface CategoryCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *cateogoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;

@end

@implementation CategoryCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupCellWithCategoryObject:(Category*)category{
    self.categoryNameLabel.text = category.categoryTitle;
    self.cateogoryImageView.image = [UIImage imageNamed:category.imageName];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
