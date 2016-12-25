//
//  AddViewController.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 21/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "AddViewController.h"
#import "AccionesViewController.h"
#import "AnimalViewController.h"
#import "GanadoViewController.h"
@interface AddViewController () 

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)MiGanadoClick:(id)sender {
     GanadoViewController *ganadoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GanadoViewController"];
    [self.navigationController pushViewController:ganadoViewController
                                         animated:YES];
}
- (IBAction)AccionesClick:(id)sender {
    AccionesViewController *accionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AccionViewController"];
    [self.navigationController pushViewController:accionViewController
                                         animated:YES];
}
- (IBAction)AnimalesClick:(id)sender {
    AnimalViewController *animalViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AnimalViewController"];
    [self.navigationController pushViewController:animalViewController
                                         animated:YES];
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
