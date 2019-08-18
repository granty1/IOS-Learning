//
//  ViewController.m
//  ToolbarSample
//
//  Created by Grant on 2019/8/18.
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
    self.label.text = @"";
    self.screen = [[UIScreen mainScreen] bounds];
}

- (IBAction)BackClick:(id)sender {
    [self doShowLabelWithSender: sender];
}

- (IBAction)SaveClick:(id)sender {
    [self doShowLabelWithSender:sender];
}
- (IBAction)HomeClick:(id)sender {
    [self doShowLabelWithSender:sender];
}

-(void) showLabelWithText:(NSString *) text{
    //self.label.text = text;
    self.label.text = text;
    self.label.numberOfLines = 0;
    [self.label sizeToFit];
}

-(UIBarButtonItem *) getToolbarObject:(id)sender{
    return (UIBarButtonItem *) sender;
}

-(void) doShowLabelWithSender:(id)sender{
    [self showLabelWithText:[self getToolbarObject:sender].title];
}

@end
