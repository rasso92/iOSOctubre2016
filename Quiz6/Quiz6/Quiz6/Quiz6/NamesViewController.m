//
//  NamesViewController.m
//  Quiz6
//
//  Created by Estudiantes on 12/3/16.
//  Copyright © 2016 Cenfotec. All rights reserved.
//

#import "NamesViewController.h"
#import "CustomViewCell.h"
#import "Person.h"
#define CUSTOM_CELL_IDENTIFIER @"CustomViewCell"
@interface NamesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *PersonArray;
@property (nonatomic, strong) NSArray *SortedPersonArray;
@end



@implementation NamesViewController

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_IDENTIFIER bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_IDENTIFIER];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self llenaPersonas];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ordenAcendente:(id)sender {
    self.PersonArray = [_PersonArray sortedArrayUsingSelector:@selector(ascending)];
    [self.tableView reloadData];
}
- (IBAction)ordenAlfabetico:(id)sender {
    self.PersonArray = [_PersonArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self.tableView reloadData];
}

-(void)llenaPersonas{
    NSMutableArray *personArray = [NSMutableArray new];
    Person *Person1 = [[Person alloc] initWithPerson:4 name:[NSString stringWithFormat:@"Enrique"]];
            [personArray addObject:Person1];
    Person *Person2 = [[Person alloc] initWithPerson:5 name:[NSString stringWithFormat:@"Christian"]];
    [personArray addObject:Person2];
    Person *Person3 = [[Person alloc] initWithPerson:1 name:[NSString stringWithFormat:@"Javier"]];
    [personArray addObject:Person3];
    Person *Person4 = [[Person alloc] initWithPerson:2 name:[NSString stringWithFormat:@"Carlos"]];
    [personArray addObject:Person4];
    Person *Person5 = [[Person alloc] initWithPerson:10 name:[NSString stringWithFormat:@"Alejandro"]];
    [personArray addObject:Person5];
    Person *Person6 = [[Person alloc] initWithPerson:9 name:[NSString stringWithFormat:@"Abismei"]];
    [personArray addObject:Person6];
    
    
    self.PersonArray = [[NSArray alloc]initWithArray:personArray];
    [self.tableView reloadData];
    
}

#pragma -mark TABLE VIEW METHODS


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _PersonArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_IDENTIFIER];
    Person *personToShow = self.PersonArray[indexPath.row];
    [cell setupCellWithPerson:personToShow];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
