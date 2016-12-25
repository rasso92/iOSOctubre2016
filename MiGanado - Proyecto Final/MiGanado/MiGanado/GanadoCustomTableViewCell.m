//
//  GanadoCustomTableViewCell.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 22/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//
#import "Ganado.h"
#import "GanadoCustomTableViewCell.h"
#import "Animal.h"
@interface GanadoCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lblNombreGanado;
@property (weak, nonatomic) IBOutlet UILabel *lblGenero;
@property (weak, nonatomic) IBOutlet UILabel *lblFechaNacimiento;
@property (weak, nonatomic) IBOutlet UILabel *lblPeso;
@property (weak, nonatomic) IBOutlet UILabel *lblEstado;

@property (weak, nonatomic) IBOutlet UILabel *lblAnimal;
@end
@implementation GanadoCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithGanado:(Ganado*)ganadoObject{
    self.lblPeso.text = [NSString stringWithFormat:@"%@",ganadoObject.ganadoWeight];
    self.lblAnimal.text = ganadoObject.animalName;
    self.lblEstado.text = [NSString stringWithFormat:@"%@",ganadoObject.ganadoState];
    self.lblGenero.text = ganadoObject.ganadoGender;
    self.lblFechaNacimiento.text = [NSString stringWithFormat:@"%@",ganadoObject.ganadoBirthDay];
    self.lblNombreGanado.text = ganadoObject.ganadoName;
}

@end
