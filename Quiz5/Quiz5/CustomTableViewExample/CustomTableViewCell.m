
//
//  Created by estudiante on 11/19/16.
//  Copyright © 2016 estudiante. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "divNumber.h"

@interface CustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupCellWithNumber:(divNumber*)number{
    self.leftLabel.text = [NSString stringWithFormat:@"%d", number.number ];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
