//
//  GanadoViewController.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 22/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "GanadoViewController.h"
#import "RealmManager.h"
#import "Ganado.h"
#import "GanadoCustomTableViewCell.h"
#import "AddGanadoViewController.h"
#define CUSTOM_CELL_ID @"GanadoCustomTableViewCell"
@interface GanadoViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property RLMResults *ganadoArray;
@end

@implementation GanadoViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Ganado";
    [self registerCell];
    [self initializeGanadoArray];
    [self.tableview reloadData];
    [self createAddUIBarButtonItem];
    [self loadGanado];
}

-(void)registerCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_ID bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_ID];
}

-(void)initializeGanadoArray{
    self.ganadoArray = [RealmManager getAllAcciones];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self loadGanado];
}

-(void)loadGanado{
    self.ganadoArray = [RealmManager getAllGanado];
    [self.tableview reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ganadoArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GanadoCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_ID];
    [cell configureCellWithGanado:(Ganado*)self.ganadoArray[indexPath.row]];
    return cell;
}
-(void)createAddUIBarButtonItem{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addItem;
}

-(void)addItem{
    AddGanadoViewController *addGanadoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddGanadoViewController"];
    [self.navigationController pushViewController:addGanadoViewController
                                         animated:YES];
}


@end
