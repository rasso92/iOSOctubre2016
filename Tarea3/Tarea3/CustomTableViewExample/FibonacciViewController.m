
//
//  Created by estudiante on 11/19/16.
//  Copyright © 2016 estudiante. All rights reserved.
//

#import "FibonacciViewController.h"
#import "FibonacciNumber.h"
#import "CustomTableViewCell.h"

#define CUSTOM_CELL_IDENTIFIER @"CustomTableViewCell"

@interface FibonacciViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *numberArray;
@end

@implementation FibonacciViewController

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self initializeFibonacci];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeFibonacci{
    int first = 0;
    int second = 1;
    int current = 0;
    NSMutableArray *numberArray = [NSMutableArray new];
    for (int index = 0; index<=1000; index++) {
        if(index < 2){
            FibonacciNumber *newNumber = [[FibonacciNumber alloc] initWithNumber:index];
            [numberArray addObject:newNumber];
        }else{

            current = first + second;
            first = second;
            second = current;
            FibonacciNumber *newNumber = [[FibonacciNumber alloc] initWithNumber:current];
            [numberArray addObject:newNumber];
        }
    }
    self.numberArray = [[NSArray alloc]initWithArray:numberArray];
}



#pragma -mark TABLE VIEW METHODS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.numberArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    FibonacciNumber *numbertoShow = self.numberArray[indexPath.row];
    [cell setupCellWithNumber:numbertoShow];
    
    return cell;
}



@end
