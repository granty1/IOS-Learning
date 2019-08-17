//
//  ViewController.m
//  AlertViewActionSheet
//
//  Created by Grant on 2019/8/17.
//  Copyright © 2019 Grant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)handleAlertClick:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"info" message:@"This is alert 🐳." preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action){
        NSLog(@"yes click.");
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"no" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"no click.");
    }]];
    
    [self presentViewController:alertController animated:true completion:nil];
}

- (IBAction)handelClickActionSheet:(id)sender {
    UIAlertController *actionSheet = [[UIAlertController alloc] init];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"cancel.");
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"cat" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self alertInfoMessage:@"🐱"];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"dog" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self alertInfoMessage:@"🐶"];
    }]];
    
    [self presentViewController:actionSheet animated:true completion:nil];
}

-(void) alertInfoMessage: (NSString *)type{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:type preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"like it." style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"%@ has been like.", type);
    }]];
    
    [self presentViewController:alertController animated:true completion:nil];
}

-(UIAlertAction *) getalertActionWithTitle:(NSString *) title andStyle: (UIAlertActionStyle) style andCallback: (void (^ __nullable)(UIAlertAction *action)) action{
    return [UIAlertAction actionWithTitle:title style:style handler:action];
}


@end
