//
//  ViewController.m
//  TextFieldTextView
//
//  Created by Grant on 2019/8/17.
//  Copyright © 2019 Grant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *abstractTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameTextField.delegate = self;
    _abstractTextView.delegate = self;
}

// 视图即将出现 时 注册通知
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    // 注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    // 注册键盘消失通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

//  即将消失时 注销通知
-(void) viewWillDisappear:(BOOL)animated{
    [self viewWillDisappear:animated];
    // 注销键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    // 注销键盘消失通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"text file 获取焦点，点击return ");
    [_nameTextField resignFirstResponder];
    return YES;
}

-(BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if  ([text isEqualToString:@"\n"]) {
        [_abstractTextView resignFirstResponder];
        NSLog(@"获取焦点");
        return NO;
    }
    return YES;
}

- (IBAction)onSubmit:(id)sender forEvent:(UIEvent *)event {
    NSLog(@"name:%@", _nameTextField.text);
    NSLog(@"abstract:%@", _abstractTextView.text);
}

-(void) keyboardDidShow: (NSNotification *) notification{
    NSLog(@"键盘打开");
}

-(void) keyboardDidHide: (NSNotification *) notification{
    NSLog(@"键盘消失");
}

@end
