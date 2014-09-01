//
//  ViewController.h
//  iOSChallengeAnthonyTran
//
//  Created by Anthony Tran on 8/28/14.
//  Copyright (c) 2014 Anthony Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomControl.h"
#import "SecondViewController.h"

@interface ViewController : UIViewController
{
    IBOutlet UIButton *randomizeButton;
    IBOutlet UIButton *goButton;

}

@property (nonatomic, retain) SecondViewController *secondViewController;
@property (nonatomic, retain) UIButton *randomizeButton;
@property (nonatomic, retain) UIButton *goButton;
@property (nonatomic) int randomizeNum;

@property (nonatomic, retain) CustomControl *controlOne;
@property (nonatomic, retain) CustomControl *controlTwo;
@property (nonatomic, retain) CustomControl *controlThree;
@property (nonatomic, retain) CustomControl *controlFour;
@property (nonatomic, retain) CustomControl *controlFive;
@property (nonatomic, retain) CustomControl *controlSix;

@property (nonatomic, copy) NSString *controlOneSelection;
@property (nonatomic, copy) NSString *controlTwoSelection;
@property (nonatomic, copy) NSString *controlThreeSelection;
@property (nonatomic, copy) NSString *controlFourSelection;
@property (nonatomic, copy) NSString *controlFiveSelection;
@property (nonatomic, copy) NSString *controlSixSelection;






-(IBAction) randomize;
-(IBAction) goNextController;
-(void) updateSelections;

@end
