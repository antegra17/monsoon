//
//  ViewController.m
//  iOSChallengeAnthonyTran
//
//  Created by Anthony Tran on 8/28/14.
//  Copyright (c) 2014 Anthony Tran. All rights reserved.
//

#import "ViewController.h"
#import "CustomControl.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize randomizeButton, randomizeNum, goButton, controlOne, controlTwo, controlThree, controlFour, controlFive, controlSix, controlOneSelection, controlTwoSelection, controlThreeSelection, controlFourSelection, controlFiveSelection, controlSixSelection, secondViewController;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    controlOne = [[CustomControl alloc] initWithFrame: CGRectMake(19,64,138,138) withSegments:4 withChoices:[NSArray arrayWithObjects:@"ONE OF A KIND", @"SMALL BATCH", @"LARGE BATCH",@"MASS MARKET", nil]];
    
    controlTwo = [[CustomControl alloc] initWithFrame: CGRectMake(163,64,138,138) withSegments:3 withChoices:[NSArray arrayWithObjects:@"SAVORY", @"SWEET", @"UMAMI", nil]];
    
    controlThree = [[CustomControl alloc] initWithFrame: CGRectMake(19,208,138,138) withSegments:2 withChoices:[NSArray arrayWithObjects:@"SPICY", @"MILD", nil]];
    
    controlFour = [[CustomControl alloc] initWithFrame: CGRectMake(163,208,138,138) withSegments:3 withChoices:[NSArray arrayWithObjects:@"CRUNCHY", @"MUSHY", @"SMOOTH", nil]];
    
    controlFive = [[CustomControl alloc] initWithFrame: CGRectMake(19,352,138,138) withSegments:2 withChoices:[NSArray arrayWithObjects:@"A LITTLE", @"A LOT", nil]];
    
    controlSix = [[CustomControl alloc] initWithFrame: CGRectMake(163,352,138,138) withSegments:5 withChoices:[NSArray arrayWithObjects:@"BREAKFAST", @"BRUNCH", @"LUNCH", @"SNACK", @"DINNER", nil]];
    
    controlOne.controlNumber = 1;
    controlTwo.controlNumber = 2;
    controlThree.controlNumber = 3;
    controlFour.controlNumber = 4;
    controlFive.controlNumber = 5;
    controlSix.controlNumber = 6;

    [self.view addSubview:controlOne];
    [self.view addSubview:controlTwo];
    [self.view addSubview:controlThree];
    [self.view addSubview:controlFour];
    [self.view addSubview:controlFive];
    [self.view addSubview:controlSix];

    
    // Do any additional setup after loading the view from its nib.
}

-(void) updateSelections
{
    controlOneSelection = controlOne.choiceLabel.text;
    controlTwoSelection = controlTwo.choiceLabel.text;
    controlThreeSelection = controlThree.choiceLabel.text;
    controlFourSelection = controlFour.choiceLabel.text;
    controlFiveSelection = controlFive.choiceLabel.text;
    controlSixSelection = controlSix.choiceLabel.text;

    NSLog(@"New Selections: %@, %@, %@, %@, %@, %@", controlOneSelection, controlTwoSelection, controlThreeSelection, controlFourSelection, controlFiveSelection, controlSixSelection);
}

-(IBAction) randomize
{
    NSUInteger r = 0;
    NSUInteger largestR = 0;
    
    do{
       controlOne.randomizeNum = r = arc4random_uniform(15);
     
        if (r > largestR) {
            largestR = r;
          
        }
    }
    
    
    while (r == 0 || r < 5);
    
    do{
        controlTwo.randomizeNum = r = arc4random_uniform(15);
        
    
        if (r > largestR) {
            largestR = r;
           
        }
    }
    while (r == 0 || r < 5);
    
    do{
        controlThree.randomizeNum = r = arc4random_uniform(15);
       
        if (r > largestR) {
            largestR = r;
            
        }
    }
    while (r == 0 || r < 5);
    
    do{
        controlFour.randomizeNum = r = arc4random_uniform(15);
        
      
        if (r > largestR) {
            largestR = r;
            
        }
    }
    while (r == 0 || r < 5);
    
    do{
        controlFive.randomizeNum = r = arc4random_uniform(15);
        
       
        if (r > largestR) {
            largestR = r;
            
        }
    }
    while (r == 0 || r < 5);
    
    do{
        controlSix.randomizeNum = r = arc4random_uniform(15);
        
     
        if (r > largestR) {
            largestR = r;
            
        }
    }
    while (r == 0 || r < 5);

    
    controlOne.cycleCount = 0;
    controlTwo.cycleCount = 0;
    controlThree.cycleCount = 0;
    controlFour.cycleCount = 0;
    controlFive.cycleCount = 0;
    controlSix.cycleCount = 0;
    
    
    [self deactivateButtons];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2
                                     target:controlOne
                                   selector:@selector(cycleSelection:)
                                   userInfo:nil
                                    repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2
                                     target:controlTwo
                                   selector:@selector(cycleSelection:)
                                   userInfo:nil
                                    repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.2
                                     target:controlThree
                                   selector:@selector(cycleSelection:)
                                   userInfo:nil
                                    repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.2
                                     target:controlFour
                                   selector:@selector(cycleSelection:)
                                   userInfo:nil
                                    repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.2
                                     target:controlFive
                                   selector:@selector(cycleSelection:)
                                   userInfo:nil
                                    repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.2
                                     target:controlSix
                                   selector:@selector(cycleSelection:)
                                   userInfo:nil
                                    repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:(0.2 * largestR)
                                     target:self
                                   selector:@selector(reactivateButtons:)
                                   userInfo:nil
                                    repeats:YES];
   

}


-(void) deactivateButtons
{
    NSLog(@"deactivating buttons");
    
    self.view.userInteractionEnabled = NO;
}



-(void) reactivateButtons: (NSTimer *) timer
{
    NSLog(@"reactivating buttons");
    self.view.userInteractionEnabled = YES;
    
    [timer invalidate];
    
    [self updateSelections];
}

-(IBAction) goNextController
{
    NSLog(@"You completed your selections!");
    [self updateSelections];
    
    secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
        
        
    [self presentViewController:secondViewController animated:YES
                     completion:nil];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
