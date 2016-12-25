//
//  AnimalCustomTableViewCell.h
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 22/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Animal;
@interface AnimalCustomTableViewCell : UITableViewCell
-(void)configureCellWithAnimal:(Animal*)animalObject;
@end