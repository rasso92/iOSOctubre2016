
//
//  Created by estudiante on 11/19/16.
//  Copyright © 2016 estudiante. All rights reserved.
//

#import "DivViewController.h"
#import "DivNumber.h"
#import "CustomTableViewCell.h"

#define CUSTOM_CELL_IDENTIFIER @"CustomTableViewCell"

@interface DivViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *numberArray;
@property (weak, nonatomic) IBOutlet UITextField *txtNumber;
@end

@implementation DivViewController

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calcEventButton:(id)sender {
    [self calculaDivisores:[_txtNumber.text intValue]]; /*De momento esta quemado el numero para probar el metodo de los divisores*/
}

-(void)calculaDivisores:(NSInteger)numero{
    NSMutableArray *numberArray = [NSMutableArray new];
    for (int index = 1; index<=numero; index++) {
        if(numero % index == 0){
            divNumber *newNumber = [[divNumber alloc] initWithNumber:index];
            [numberArray addObject:newNumber];
        }
    }
    self.numberArray = [[NSArray alloc]initWithArray:numberArray];
    [self.tableView reloadData];
   
}

#pragma -mark TABLE VIEW METHODS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.numberArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    divNumber *numbertoShow = self.numberArray[indexPath.row];
    [cell setupCellWithNumber:numbertoShow];
    
    return cell;
}



@end
