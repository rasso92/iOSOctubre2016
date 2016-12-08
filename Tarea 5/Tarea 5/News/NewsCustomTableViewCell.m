//
//  NewsCustomTableViewCell.m
//  News
//
//  Created by Cesar Brenes on 11/19/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import "NewsCustomTableViewCell.h"
#import "News.h"


@interface NewsCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsDateLabel;

@end

@implementation NewsCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithNews:(News*)newsObject{
    self.newsTitleLabel.text = newsObject.newsTitle;
    self.newsDateLabel.text = [self getDateInStringFormatWithDate:newsObject.newsDate];
}


-(NSString*)getDateInStringFormatWithDate:(NSDate*)date{
    NSString *localizedDateTime = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
    return localizedDateTime;
}

@end
