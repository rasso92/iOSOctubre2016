//
//  HomeViewController.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 21/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "HomeViewController.h"
#import "AddViewController.h"
#import "GanadoActivoViewController.h"
#import "NotificacionesViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createAddUIBarButtonItem];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createAddUIBarButtonItem{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addItem;
}
- (IBAction)onClickNotificaciones:(id)sender {
    NotificacionesViewController *notificacionesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NotificacionesViewController"];
    [self.navigationController pushViewController:notificacionesViewController
                                         animated:YES];
}
- (IBAction)onClickMiGanado:(id)sender {
    GanadoActivoViewController *ganadoActivoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GanadoActivoViewController"];
    [self.navigationController pushViewController:ganadoActivoViewController
                                         animated:YES];
}

-(void)addItem{
    AddViewController *addViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    [self.navigationController pushViewController:addViewController
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
