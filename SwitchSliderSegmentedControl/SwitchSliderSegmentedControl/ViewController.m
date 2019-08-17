//
//  ViewController.m
//  SwitchSliderSegmentedControl
//
//  Created by Grant on 2019/8/17.
//  Copyright © 2019 Grant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _slider.maximumValue = 100;
    _slider.minimumValue = 0;
    _slider.value = 50;
    _sliderText.text = [self getStringValueWithInt:_slider.value];
}

- (IBAction)switchOnChange:(id)sender {
    UISwitch *isSwitch = (UISwitch * )sender;
    BOOL setting = isSwitch.isOn;
    NSLog(@"%@", setting == YES ?  @"YES" : @"No");
    [_leftSwitch setOn:setting];
    [_rightSwitch setOn:setting];
}
- (IBAction)touchDown:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSLog(@"当前选择的是：%li", segmentedControl.selectedSegmentIndex);
}

- (IBAction)sliderOnChange:(id)sender {
    UISlider *slider = (UISlider *) sender;
    _sliderText.text = [self getStringValueWithInt:slider.value];
}
     
 -(NSString *) getStringValueWithInt:(float)value{
     return [[NSString alloc] initWithFormat:@"%.1f", value];
 }


@end
