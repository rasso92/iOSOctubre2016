//
//  CustomViewCell.m
//  Quiz6
//
//  Created by Estudiantes on 12/3/16.
//  Copyright © 2016 Cenfotec. All rights reserved.
//

#import "CustomViewCell.h"
#import "Person.h"
@interface CustomViewCell()

@property (weak, nonatomic) IBOutlet UILabel *txtOrder;

@property (weak, nonatomic) IBOutlet UILabel *txtName;
@end
@implementation CustomViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setupCellWithPerson:(Person*)person{
    self.txtName.text = [NSString stringWithFormat:@"%@", person.name ];
    self.txtOrder.text = [NSString stringWithFormat:@"%d", person.order ];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
			
