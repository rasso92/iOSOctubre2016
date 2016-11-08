//
//  ResultViewController.m
//  Tarea_1
//
//  Created by user122432 on 11/5/16.
//  Copyright © 2016 asanchez. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblResult.text =[NSString stringWithFormat:@"El resultado es: %d",self.result ];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
