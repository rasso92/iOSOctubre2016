//
//  CustomAccionTableViewCell.h
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 21/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Accion;
@interface CustomAccionTableViewCell : UITableViewCell
-(void)configureCellWithAcciones:(Accion*)accionObject;
@end
