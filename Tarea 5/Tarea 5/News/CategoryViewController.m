//
//  CategoryViewController.m
//  News
//
//  Created by Cesar Brenes on 11/12/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryCustomTableViewCell.h"
#import "Category.h"
#import "NewsViewController.h"

#define CUSTOM_CELL_ID @"CategoryCustomTableViewCell"

@interface CategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *categoryArray;
@end

@implementation CategoryViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Categorías";
    [self registerCell];
    [self initializeCategoryArray];
}

-(void)registerCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_ID bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_ID];
}

-(void)initializeCategoryArray{
    Category *category1 = [[Category alloc] initWithTitle:@"Sucesos" imageName:@"incident" newsArray:[NSMutableArray new]];
    Category *category2 = [[Category alloc] initWithTitle:@"Tecnología" imageName:@"technology" newsArray:[NSMutableArray new]];
    Category *category3 = [[Category alloc] initWithTitle:@"Deportes" imageName:@"sports" newsArray:[NSMutableArray new]];
    Category *category4 = [[Category alloc] initWithTitle:@"Economía" imageName:@"economy" newsArray:[NSMutableArray new]];
    self.categoryArray = [[NSMutableArray alloc] initWithObjects:category1,category2,category3,category4,nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categoryArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_ID];
    Category *categoryToShow = self.categoryArray[indexPath.row];
    [cell setupCellWithCategoryObject:categoryToShow];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsViewController * newsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsViewController"];
    Category *categorySelected = self.categoryArray[indexPath.row];
    newsViewController.newsArray = categorySelected.newsArray;
    [self.navigationController pushViewController:newsViewController animated:YES];
}


@end
