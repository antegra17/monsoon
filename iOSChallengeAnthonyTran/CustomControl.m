//
//  CustomControl.m
//  iOSChallengeAnthonyTran
//
//  Created by Anthony Tran on 8/28/14.
//  Copyright (c) 2014 Anthony Tran. All rights reserved.
//

#import "CustomControl.h"
#import "ViewController.h"
#import "AppDelegate.h"

@implementation CustomControl

@synthesize numberOfSegments, currentSelection, touchActive, cycleCount, randomizeNum, choiceLabel, choiceList, controlNumber;


ViewController *viewController;
AppDelegate *appDelegate;


- (id)initWithFrame:(CGRect)frame withSegments: (int) numOfSegments withChoices:(NSArray *) choices
{
   
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        viewController = appDelegate.viewController;
        
        self.backgroundColor = [UIColor clearColor];
        self.numberOfSegments = numOfSegments;
        
        touchActive = FALSE;
        choiceList = choices;
        choiceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/2 - 20, 138, 40)];
        choiceLabel.textColor = [UIColor whiteColor];
        choiceLabel.font = [UIFont fontWithName:@"Futura" size:14];
        choiceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview: choiceLabel];
        choiceLabel.text = [choices objectAtIndex:0];
        currentSelection = 1;
        
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    touchActive = TRUE;
    
    [self cycleSelection];

}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
 
    touchActive = FALSE;
    
    [self setNeedsDisplay];

    
}


- (void)cycleSelection
{

        currentSelection++;
        
        if (currentSelection > self.numberOfSegments)
            currentSelection = 1;
        
        NSString *currentChoice = [self.choiceList objectAtIndex:currentSelection-1];
        NSLog(@"%@", currentChoice);
        
        
        choiceLabel.text = [self.choiceList objectAtIndex:currentSelection -1];
    
        
        [self setNeedsDisplay];
    
        [viewController updateSelections];
    
        

    
}


- (void)cycleSelection: (NSTimer *) timer
{
    cycleCount++;
    
    if (cycleCount < randomizeNum)
    {
        currentSelection++;
        
        if (currentSelection > self.numberOfSegments)
            currentSelection = 1;
        
        NSString *currentChoice = [self.choiceList objectAtIndex:currentSelection-1];
        NSLog(@"%@", currentChoice);
        
        
        choiceLabel.text = [self.choiceList objectAtIndex:currentSelection -1];
        
        [self setNeedsDisplay];
    }
    else{
        [timer invalidate];
        cycleCount = 0;
    }
    
}












// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(ctx, 4.0);
    CGContextSetStrokeColorWithColor(ctx,
                                     [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(5.5f,5.5f,127,127);
    CGContextAddEllipseInRect(ctx, rectangle);
    
    if (self.touchActive == YES)
    {
        CGContextSetFillColorWithColor(ctx,[UIColor purpleColor].CGColor);
    }
    else{
        CGContextSetFillColorWithColor(ctx,[UIColor blackColor].CGColor);
    }
    
    CGContextSetAlpha(ctx,0.2);
    CGContextFillPath(ctx);
    
    
    float arcGap;
    float startAngle;
    float startAngleCorrection;
    float startArcAngle;
    float arcLength;
    float endArcAngle;
    
    arcGap = M_PI / 30;
    startAngle = -(M_PI/2) + arcGap;
    startAngleCorrection = 0;
    arcLength = 0;
    
    
    if(self.numberOfSegments == 2)
    {
        arcLength = (M_PI*2)/2 - (2*arcGap);
    }
    if(self.numberOfSegments == 3)
    {
        startAngleCorrection = - (M_PI*2) /6;
        arcLength = (M_PI*2)/3 - (2*arcGap);
    }
    else if (self.numberOfSegments == 4)
    {
        arcLength = (M_PI*2)/4 - (2*arcGap);
    }
    else if (self.numberOfSegments == 5)
    {
        startAngleCorrection =  - (M_PI*2) /10;
        arcLength = (M_PI*2)/5 - (2*arcGap);
    }
    

    startArcAngle = startAngle + startAngleCorrection;
    endArcAngle = startArcAngle + arcLength;
    
    for (int i = 1; i <= self.numberOfSegments; i++)
    {
        
        CGContextAddArc(ctx, 69, 69, 67,  startArcAngle, endArcAngle, 0);
        
        if (currentSelection == i) [[UIColor redColor] setStroke];
        else [[UIColor blackColor] setStroke];
    
        CGContextSetLineWidth(ctx, 1);
        CGContextSetLineCap(ctx, kCGLineCapButt);

        CGContextSetAlpha(ctx,1);
        CGContextDrawPath(ctx, kCGPathStroke);
        
        startArcAngle  = startArcAngle + arcLength + (2*arcGap);
        endArcAngle = startArcAngle + arcLength;
    }

    
}


@end
