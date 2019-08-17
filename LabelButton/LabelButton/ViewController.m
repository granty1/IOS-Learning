//
//  ViewController.m
//  LabelButton
//
//  Created by Grant on 2019/8/17.
//  Copyright © 2019 Grant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onClick:(id)sender {
    self.label.text = @"Hello world";
}

@end
