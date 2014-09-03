//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by Mai Ho on 9/2/14.
//  Copyright (c) 2014 Mai Ho. All rights reserved.
//

#import "BullsEyeViewController.h"

@interface BullsEyeViewController ()

@end

@implementation BullsEyeViewController
{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
    int difference = abs(_currentValue - _targetValue);
    int points = 100 - difference;
    _score += points;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Hello, World"
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"Awesome" otherButtonTitles:nil];
  
    [alertView show];
    
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(slider.value);
}

- (void)startNewRound {
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    _round += 1;
    self.slider.value = _currentValue;
}

- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

@end
