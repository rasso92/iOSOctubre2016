//
//  AnimalViewController.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 22/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "AnimalViewController.h"
#import "RealmManager.h"
#import "AnimalCustomTableViewCell.h"
#import "AddAnimalViewController.h"

#define CUSTOM_CELL_ID @"AnimalCustomTableViewCell"
@interface AnimalViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property RLMResults *animalsArray;
@end

@implementation AnimalViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Animales";
    [self createAddUIBarButtonItem];
    [self registerCell];
    [self initializeAnimalesArray];
    [self.tableview reloadData];
    //[self createAddUIBarButtonItem];
}

-(void)registerCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_ID bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_ID];
}

-(void)initializeAnimalesArray{
    self.animalsArray = [RealmManager getAllAnimals];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self loadNews];
}

-(void)loadNews{
    self.animalsArray = [RealmManager getAllAnimals];
    [self.tableview reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.animalsArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AnimalCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_ID];
    [cell configureCellWithAnimal:(Animal*)self.animalsArray[indexPath.row]];
    return cell;
}
-(void)createAddUIBarButtonItem{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addItem;
}

-(void)addItem{
    AddAnimalViewController *addAnimalViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddAnimalViewController"];
    [self.navigationController pushViewController:addAnimalViewController
                                         animated:YES];
}


@end
