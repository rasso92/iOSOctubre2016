//
//  DogsTableViewController.m
//  TableViewDefaultExample
//
//  Created by Estudiantes on 29/10/16.
//  Copyright © 2016 Cenfotec. All rights reserved.
//

#import "MathTableViewController.h"
#define OPERATION @"operation"
#define RESULT @"result"
@interface MathTableViewController ()

@end

@implementation MathTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDictionary];
}
-(void)createDictionary{
    [self fillData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)fillData{
    self.operationsArray = [[NSMutableArray alloc] init];
    self.resultArray = [[NSMutableArray alloc] init];
    for(int i = 1; i<=17;i++){
        [self.operationsArray addObject:[NSString stringWithFormat:@"7 x %d",i]];
        [self.resultArray addObject:[NSString stringWithFormat:@"%d",i*7]];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.operationsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *currentOperation = self.operationsArray[indexPath.row];
    NSString *currentResult = self.resultArray[indexPath.row];
    cell.textLabel.text =[NSString stringWithFormat:@"%@", currentOperation];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", currentResult];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end