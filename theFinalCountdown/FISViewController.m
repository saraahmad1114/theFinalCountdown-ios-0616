//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerOutlet;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *startButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *pauseButtonOutlet;
@property (retain, nonatomic) NSTimer *timer;
@property (nonatomic) NSUInteger second;
@property (nonatomic) NSUInteger remainingSeconds;
//we are creating this property because we need something to hold our seconds, something for the counter to countdown



@end

@implementation FISViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pauseButtonOutlet.enabled = NO;
    self.startButtonOutlet.enabled = YES;
    self.timerOutlet.hidden = YES;
}

- (IBAction)startButtonAction:(id)sender {
   
    self.datePicker.hidden = YES;
    self.pauseButtonOutlet.enabled = YES;
    self.timerOutlet.hidden = NO;
    self.second = self.datePicker.countDownDuration;
    //it takes whatever time you have and will turn it into seconds
    
    
    NSLog(@"%lu", self.second);
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
//    NSLog(@"Time remaining: %lu", self.second);
    [self.startButtonOutlet setTitle:@"cancel" forState:UIControlStateNormal];
    self.pauseButtonOutlet.enabled = YES;
}
- (IBAction)pauseButttonAction:(id)sender {
    
    if([self.pauseButtonOutlet.titleLabel.text isEqualToString:@"resume"]) {
        [self.pauseButtonOutlet setTitle:@"pause" forState:UIControlStateNormal];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    else {
        [self.pauseButtonOutlet setTitle:@"resume" forState:UIControlStateNormal];
        [self.timer invalidate];
    }
}



-(void)countDown
{
    self.second --;
    NSLog(@"%lu" ,self.second);
    NSUInteger hours = (NSUInteger)(self.second/(60*60));
    NSUInteger minutes = (NSUInteger)(((NSUInteger)self.second/60)- (hours *60));
    NSUInteger seconds = (NSUInteger)(((NSUInteger)self.second - (60 * minutes)-( hours * 60 * 60)));
    self.timerOutlet.text = [NSString stringWithFormat:@"%lu : %lu : %lu", hours, minutes, seconds];
    
//    self.timerOutlet.text = [NSString stringWithFormat:@"%lu", self.second];

}
- (void)viewWillAppear:(BOOL)animated
{
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
