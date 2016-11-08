//
//  CalcViewController.m
//  Tarea_1
//
//  Created by user122432 on 11/5/16.
//  Copyright © 2016 asanchez. All rights reserved.
//

#import "CalcViewController.h"
#import "ResultViewController.h"

@interface CalcViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtFirstNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtSecondNumber;

@end

@implementation CalcViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Calc Actions


- (IBAction)AddOperation:(id)sender {
    
    int firstNumber = ([self.txtFirstNumber.text floatValue]);
    int secondNumber = ([self.txtSecondNumber.text floatValue]);
    int result = firstNumber + secondNumber;
    ResultViewController *NextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
    NextViewController.result = result;
    NSLog(@"%d",result);
    [self.navigationController pushViewController:NextViewController animated:YES];
}

- (IBAction)SubstractOperation:(id)sender {
    int firstNumber = ([self.txtFirstNumber.text floatValue]);
    int secondNumber = ([self.txtSecondNumber.text floatValue]);
    int result = firstNumber - secondNumber;
    ResultViewController *NextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
    NextViewController.result = result;
    NSLog(@"%d",result);
    [self.navigationController pushViewController:NextViewController animated:YES];
}

- (IBAction)MultOperation:(id)sender {
    int firstNumber = ([self.txtFirstNumber.text floatValue]);
    int secondNumber = ([self.txtSecondNumber.text floatValue]);
    int result = firstNumber * secondNumber;
    ResultViewController *NextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
    NextViewController.result = result;
    NSLog(@"%d",result);
    [self.navigationController pushViewController:NextViewController animated:YES];
}
- (IBAction)DivOperation:(id)sender {
    int firstNumber = ([self.txtFirstNumber.text floatValue]);
    int secondNumber = ([self.txtSecondNumber.text floatValue]);
    if([self isZero:secondNumber]==false && [self isNumeric:self.txtSecondNumber.text]){
        int result = firstNumber / secondNumber;
        ResultViewController *NextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
        NextViewController.result = result;
        NSLog(@"%d",result);
        [self.navigationController pushViewController:NextViewController animated:YES];
    }else{
        NSLog(@"%s","No debe ingresar caracteres alfanumericos ni puede dividir entre 0");
    }

}

#pragma mark - Validations
-(BOOL)isNumeric:(NSString*)inputString{
    NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:inputString];
    return [alphaNumbersSet isSupersetOfSet:stringSet];
}
-(BOOL)isZero:(int)value{
    if(value == 0){
        return true;
    }else{
        return false;
    }
}

@end
