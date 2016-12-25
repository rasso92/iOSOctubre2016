//
//  CustomAccionTableViewCell.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 21/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "CustomAccionTableViewCell.h"
#import "Accion.h"
@interface CustomAccionTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lblNombreAccion;

@property (weak, nonatomic) IBOutlet UILabel *lblNombreProximaAccion;
@property (weak, nonatomic) IBOutlet UILabel *lblFrecuenciaDias;

@end
@implementation CustomAccionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configureCellWithAcciones:(Accion*)accionObject{
    self.lblNombreAccion.text = accionObject.accionName;
    self.lblFrecuenciaDias.text = [NSString stringWithFormat:@"%@",accionObject.FrequencyInDays];
    self.lblNombreProximaAccion.text = accionObject.nextAccionName;
}

@end
