//
//  ViewController.m
//  UploadDownload
//
//  Created by Grant on 2019/8/17.
//  Copyright © 2019 Grant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UILabel *progressValue;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
@property(strong, nonatomic) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _progressValue.text = @"";
    _progress.progress = 0.0f;
}
- (IBAction)handelUpload:(id)sender {
    [_activityIndicatorView isAnimating] ? [_activityIndicatorView stopAnimating] : [_activityIndicatorView startAnimating];
}


- (IBAction)handelDownload:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(download) userInfo:nil repeats:YES];
    _downloadButton.enabled = NO;
}

-(void) download{
    float value = _progress.progress * 100;
    NSString *valueStr = [NSString stringWithFormat:@"%.0f", value];
    valueStr = [valueStr stringByAppendingString:@"%"];
    _progressValue.text = valueStr;
    self.progress.progress += 0.01;
    if (self.progress.progress == 1.0) {
        [self.timer invalidate];
        [self sendAlertNotification];
        self.downloadButton.enabled = YES;
    }
}
- (IBAction)handelReset:(id)sender {
    _progress.progress = 0.0f;
    _progressValue.text = @"";
    [self.timer invalidate];
}

-(void) sendAlertNotification{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"" message:@"下载完成！⛄️" preferredStyle:UIAlertControllerStyleAlert];
    
    [controller addAction:[UIAlertAction actionWithTitle:@"i know" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:controller animated:true completion:nil];
}


@end
