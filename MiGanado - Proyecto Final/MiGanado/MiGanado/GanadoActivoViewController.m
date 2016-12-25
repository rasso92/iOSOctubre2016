//
//  GanadoActivoViewController.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 23/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "GanadoActivoViewController.h"
#import "RealmManager.h"
#import "Ganado.h"
#import "GanadoCustomTableViewCell.h"
#import "AddGanadoViewController.h"
#define CUSTOM_CELL_ID @"GanadoCustomTableViewCell"
@interface GanadoActivoViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property RLMResults *ganadoArray;
@end

@implementation GanadoActivoViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"#MiGanado";
    [self registerCell];
    [self initializeGanadoArray];
    [self.tableview reloadData];
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





@end
