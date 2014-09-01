//
//  CustomNavButton.m
//  iOSChallengeAnthonyTran
//
//  Created by Anthony Tran on 8/30/14.
//  Copyright (c) 2014 Anthony Tran. All rights reserved.
//

#import "CustomNavButton.h"



@implementation CustomNavButton
@synthesize selected;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if (!selected)
    {
        [self setAlpha:1];
        selected = YES;
  
    }
    
    
    NSLog(@"touch began");
}



-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event

{
    [super touchesEnded:touches withEvent:event];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
