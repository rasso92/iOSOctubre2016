//
//  NewsViewController.m
//  News
//
//  Created by Cesar Brenes on 11/19/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCustomTableViewCell.h"
#import "UITableView+RegisterCustomCell.h"
#import "AddNewsTableViewController.h"

#define CUSTOM_CELL_ID @"NewsCustomTableViewCell"

@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCell];
    [self createAddNewsUIBarButtonItem];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self.tableView reloadData];
}

-(void)createAddNewsUIBarButtonItem{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addItem;
}

-(void)addItem{
    AddNewsTableViewController *addNewsTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewsTableViewController"];
    addNewsTableViewController.newsArray = self.newsArray;
    [self.navigationController pushViewController:addNewsTableViewController
                                         animated:YES];
}

-(void)registerCell{
    [self.tableView registerCellWithIdentifier:CUSTOM_CELL_ID];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_ID];
    [cell configureCellWithNews:self.newsArray[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     [self.newsArray removeObjectAtIndex:indexPath.row];
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 }

@end
