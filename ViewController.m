//
//  ViewController.m
//  TaxCalculator
//
//  Created by Rumiya Murtazina on 9/21/15.
//  Copyright © 2015 abearablecode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property double caTax;
@property double chiTax;
@property double nyTax;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.caTax = 7.5;
    self.chiTax = 9.25;
    self.nyTax = 4.5;
}

- (IBAction)onCalculateButtonTapped:(id)sender {

    // convert priceTextField label to double
    double priceToDouble = [self.priceTextField.text doubleValue];

    double result;
    if (priceToDouble>0) {
    if (self.segmentControl.selectedSegmentIndex == 0) {

        //calculate CA tax
        result = priceToDouble / 100 * self.caTax;

    } else if (self.segmentControl.selectedSegmentIndex == 1) {

        //calculate CHI tax
        result = priceToDouble / 100 * self.chiTax;

    } else if (self.segmentControl.selectedSegmentIndex == 2) {

        //calculate NY tax
        result = priceToDouble / 100 * self.nyTax;

    }
        // display result rounded to 2 decimals
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", result];

    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:self.view] anyObject];

    //dismiss the keyboard to show the "Calculate Tax" button
    if ([[touch.view class] isSubclassOfClass:[UILabel class]]) {
        [self.view endEditing:YES];
    }
}

@end
