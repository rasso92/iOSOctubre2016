//
//  AddNewsTableViewController.m
//  News
//
//  Created by Cesar Brenes on 11/19/16.
//  Copyright © 2016 Cesar Brenes. All rights reserved.
//

#import "AddNewsTableViewController.h"
#import "News.h"

@interface AddNewsTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@end

@implementation AddNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSaveUIBarButtonItem];
}

-(void)addSaveUIBarButtonItem{
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNews)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
}

-(void)saveNews{
    News *newsObject = [[News alloc] initWithTitle:self.titleTextField.text description:self.descriptionTextView.text date:[NSDate date]];
    [self.newsArray addObject:newsObject];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}

#pragma mark - Table view data source

@end
