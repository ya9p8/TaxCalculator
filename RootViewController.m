//
//  RootViewController.m
//  TaxCalculator
//
//  Created by Yemi Ajibola on 12/27/15.
//  Copyright © 2015 Yemi Ajibola. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property double caTax;
@property double chiTax;
@property double nyTax;
@property (weak, nonatomic) IBOutlet UILabel *restultLabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting prices for taxes
    self.caTax = .075;
    self.chiTax = .0925;
    self.nyTax = .045;
}

- (IBAction)onCalculateButtonTapped:(id)sender {
    
    // Retrieve text from priceTextField converting it to int and storing to local variable
    
    double price = [self.priceTextField.text intValue];
    double salesTax;
    
    // Multiply sales tax depending on segment
    
    // California sales tax
    if(self.segmentedControl.selectedSegmentIndex == 0)
    {
        salesTax = price * self.caTax;
    }
    // Chicago sales tax
    else if (self.segmentedControl.selectedSegmentIndex == 1)
    {
        salesTax = price * self.chiTax;
    }
    // New York sales tax
    else
    {
        salesTax = price * self.nyTax;
    }
    
    NSNumber *salesTaxNumber = [NSNumber numberWithDouble:salesTax];
    
    // Format number
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *formattedNumberString = [formatter stringFromNumber:salesTaxNumber];
    
    // Setting results to label
    
    self.restultLabel.text = formattedNumberString;
    
    }



@end
