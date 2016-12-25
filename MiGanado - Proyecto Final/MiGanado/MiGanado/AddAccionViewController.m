//
//  AddAccionViewController.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 21/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "AddAccionViewController.h"
#import "RealmManager.h"
@interface AddAccionViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtNextAccion;

@property (weak, nonatomic) IBOutlet UITextField *txtFrequencyInDays;
@property (weak, nonatomic) IBOutlet UITextField *txtAccionName;
@end

@implementation AddAccionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)OnClickSave:(id)sender {
        [RealmManager createAccionWithName:self.txtAccionName.text nextAccionName:self.txtNextAccion.text FrequencyInDays:@([self.txtFrequencyInDays.text intValue])];
        [self.navigationController popViewControllerAnimated:YES];
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
