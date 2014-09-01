//
//  CustomControl.h
//  iOSChallengeAnthonyTran
//
//  Created by Anthony Tran on 8/28/14.
//  Copyright (c) 2014 Anthony Tran. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomControl : UIControl

@property (nonatomic) int numberOfSegments;
@property (nonatomic) int currentSelection;
@property (nonatomic) BOOL touchActive;
@property (nonatomic) int cycleCount;
@property (nonatomic) int randomizeNum;
@property (nonatomic, retain) UILabel *choiceLabel;
@property (nonatomic, retain) NSArray *choiceList;
@property (nonatomic) int controlNumber;



- (id)initWithFrame:(CGRect)frame withSegments: (int) numOfSegments withChoices: (NSArray *) choices;


- (void)cycleSelection;
- (void)cycleSelection: (NSTimer *) timer;

@end
