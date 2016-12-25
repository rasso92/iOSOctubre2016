//
//  GanadoCustomTableViewCell.h
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 22/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Ganado;
@class Animal;
@interface GanadoCustomTableViewCell : UITableViewCell
-(void)configureCellWithGanado:(Ganado*)ganadoObject;
@end
