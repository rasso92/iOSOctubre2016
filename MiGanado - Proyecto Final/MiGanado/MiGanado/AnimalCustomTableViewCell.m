//
//  AnimalCustomTableViewCell.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 22/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "AnimalCustomTableViewCell.h"
#import "Animal.h"
@interface AnimalCustomTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *lblAnimalName;

@end
@implementation AnimalCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configureCellWithAnimal:(Animal*)animalObject{
    self.lblAnimalName.text = animalObject.animalName;
}
@end
