//
//  AddGanadoViewController.m
//  MiGanado
//
//  Created by Jose Miguel Quesada Varela on 22/12/16.
//  Copyright © 2016 Alejandro Sanchez. All rights reserved.
//

#import "AddGanadoViewController.h"
#import "Ganado.h"
#import "Animal.h"
#import "RealmManager.h"

@interface AddGanadoViewController ()<UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *AnimalPicker;
@property (weak, nonatomic) IBOutlet UITextField *nombreGanado;
@property (weak, nonatomic) IBOutlet UITextField *ganadoPeso;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerGenero;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerNacimiento;
@property (strong,nonatomic)  NSArray *generoArray;
@property RLMResults *animalsArray;

@end

@implementation AddGanadoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeAnimalesArray];
    self.generoArray = @[@"Macho", @"Hembra",];
    // Do any additional setup after loading the view.
}


-(void)initializeAnimalesArray{
    self.animalsArray = [RealmManager getAllAnimals];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    if (pickerView == self.AnimalPicker)
    {
        // First Picker
    }
    else if (pickerView == self.pickerGenero)
    {
        // First Picker
    }
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.AnimalPicker)
    {
        // First Picker
        return self.animalsArray.count;
    }
    else if (pickerView == self.pickerGenero)
    {
        // Second Picker
        return self.generoArray.count;
    }
    
    // A third picker passed in somehow
    return 0;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (pickerView == self.AnimalPicker)
    {
        // First Picker
        return 1;
    }
    else if (pickerView == self.pickerGenero)
    {
        // Second Picker
        return 1;
    }
    
    // A third picker passed in somehow
    return 0;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title;
    
    if (pickerView == self.AnimalPicker)
    {
        // First Picker
        Animal *animal =self.animalsArray[row];
        title = animal.animalName ;
    }
    else if (pickerView == self.pickerGenero)
    {
        // Second Picker
        title = self.generoArray[row];
    }
    
    return title;
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (pickerView == self.AnimalPicker)
    {
        // First Picker
        return 300;
    }
    else if (pickerView == self.pickerGenero)
    {
        // Second Picker
        return 400;
    }
    
    // A third picker passed in somehow
    return 0;
}
- (IBAction)onClickGuardar:(id)sender {
    Animal *animal = [self.animalsArray objectAtIndex:[self.AnimalPicker selectedRowInComponent:0]];
    [RealmManager createGanadoWithName:self.nombreGanado.text
                           ganadoBirth:self.datePickerNacimiento.date
                          ganadoGender:[self.generoArray objectAtIndex:[self.pickerGenero selectedRowInComponent:0]]
                          ganadoWeight:@([self.ganadoPeso.text intValue])
                            animalName:animal.animalName];
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
