
//
//  Created by estudiante on 11/19/16.
//  Copyright © 2016 estudiante. All rights reserved.
//

#import "ColorNumbersViewController.h"
#import "ColorNumber.h"
#import "CustomTableViewCell.h"

#define CUSTOM_CELL_IDENTIFIER @"CustomTableViewCell"

@interface ColorNumbersViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *numberArray;
@end

@implementation ColorNumbersViewController

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self initializeDogsArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeDogsArray{
    NSMutableArray *numberArray = [NSMutableArray new];
    for (int index = 1; index<=5000; index++) {
        ColorNumber *newNumber = [[ColorNumber alloc] initWithNumber:index];
        [numberArray addObject:newNumber];
    }
    self.numberArray = [[NSArray alloc]initWithArray:numberArray];
}



#pragma -mark TABLE VIEW METHODS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.numberArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    ColorNumber *numbertoShow = self.numberArray[indexPath.row];
    [cell setupCellWithNumber:numbertoShow];
    if(indexPath.row % 2 == 0){
        [cell setBackgroundColor:[UIColor redColor]];
    }else{
        [cell setBackgroundColor:[UIColor blueColor]];
    }
    
    return cell;
}



@end
