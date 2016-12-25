//
//  AccionesViewController.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 21/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "AccionesViewController.h"
#import "Accion.h"
#import "CustomAccionTableViewCell.h"
#import "RealmManager.h"
#import "AddAccionViewController.h"
#define CUSTOM_CELL_ID @"CustomAccionTableViewCell"
@interface AccionesViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property RLMResults *accionesArray;
@end

@implementation AccionesViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Acciones";
    [self registerCell];
    [self initializeAccionesArray];
    [self.tableview reloadData];
    [self createAddUIBarButtonItem];
}

-(void)registerCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_ID bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_ID];
}

-(void)initializeAccionesArray{
    self.accionesArray = [RealmManager getAllAcciones];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self loadNews];
}

-(void)loadNews{
    self.accionesArray = [RealmManager getAllAcciones];
    [self.tableview reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.accionesArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomAccionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_ID];
    [cell configureCellWithAcciones:(Accion*)self.accionesArray[indexPath.row]];
    return cell;
}
-(void)createAddUIBarButtonItem{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addItem;
}

-(void)addItem{
    AddAccionViewController *addAccionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddAccionViewController"];
    [self.navigationController pushViewController:addAccionViewController
                                         animated:YES];
}

@end
