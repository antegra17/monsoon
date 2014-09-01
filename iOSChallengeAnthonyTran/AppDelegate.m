//
//  AppDelegate.m
//  iOSChallengeAnthonyTran
//
//  Created by Anthony Tran on 8/28/14.
//  Copyright (c) 2014 Anthony Tran. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CustomNavButton.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize navController, searchIcon, calendarIcon, compassIcon, menuIcon;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    
    
    self.navController = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    
    
   self.window.rootViewController = navController;
    
    
    [self.navController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navController.navigationBar.shadowImage = [UIImage new];
    self.navController.navigationBar.translucent = YES;
    
    searchIcon = [[CustomNavButton alloc] init];
    calendarIcon = [CustomNavButton buttonWithType:UIButtonTypeCustom];
    compassIcon = [CustomNavButton buttonWithType:UIButtonTypeCustom];
    menuIcon = [CustomNavButton buttonWithType:UIButtonTypeCustom];

    [searchIcon setImage:[UIImage imageNamed:@"MON_searchIcon.png"] forState:UIControlStateNormal];
    [calendarIcon setImage:[UIImage imageNamed:@"MON_calendarIcon.png"] forState:UIControlStateNormal];
    [compassIcon setImage:[UIImage imageNamed:@"MON_compassIcon.png"] forState:UIControlStateNormal];
    [menuIcon setImage:[UIImage imageNamed:@"MON_menuIcon.png"] forState:UIControlStateNormal];
    
    searchIcon.frame = CGRectMake(0,0, 23,23);
    calendarIcon.frame = CGRectMake(0,0, 23,23);
    compassIcon.frame = CGRectMake(0,0, 23,23);
    menuIcon.frame = CGRectMake(0,0, 23,13);
    
    calendarIcon.imageView.alpha = 0.5;
    compassIcon.imageView.alpha = 0.5;
    calendarIcon.imageView.alpha = 0.5;
    
    
    [searchIcon addTarget:self action:@selector(gotoSearch:) forControlEvents:UIControlEventTouchUpInside];
    
    [calendarIcon addTarget:self action:@selector(gotoCalendar:) forControlEvents:UIControlEventTouchUpInside];
    
    [compassIcon addTarget:self action:@selector(gotoCompass:) forControlEvents:UIControlEventTouchUpInside];
    
    [menuIcon addTarget:self action:@selector(gotoMenu:) forControlEvents:UIControlEventTouchUpInside];

    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithCustomView:searchIcon];
    
    UIBarButtonItem *calendarButton = [[UIBarButtonItem alloc] initWithCustomView:calendarIcon];
    
    UIBarButtonItem *compassButton = [[UIBarButtonItem alloc] initWithCustomView:compassIcon];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:menuIcon];

    
    self.viewController.navigationItem.leftItemsSupplementBackButton = YES;
    self.viewController.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:searchButton, calendarButton, compassButton, nil];
     self.viewController.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:menuButton, nil];
    
    //[self.window setRootViewController:navController];
    [self.window makeKeyAndVisible];

    
    // Override point for customization after application launch.
    return YES;
}

-(void) gotoSearch: (UIButton *) sender
{
    

    calendarIcon.selected = NO;
    calendarIcon.imageView.alpha = 0.5;
    
  
    compassIcon.selected = NO;
    compassIcon.imageView.alpha = 0.5;
    
    
    menuIcon.selected = NO;
    menuIcon.imageView.alpha = 0.5;
    
    NSLog(@"goto search");
    
}

-(void) gotoCalendar: (UIButton *) sender
{
    
    searchIcon.selected = NO;
    searchIcon.imageView.alpha = 0.5;
    NSLog(@"goto calendar");
    
 
    compassIcon.selected = NO;
    compassIcon.imageView.alpha = 0.5;
    
    menuIcon.selected = NO;
    menuIcon.imageView.alpha = 0.5;
    
    NSLog(@"goto search");
}

-(void) gotoCompass: (UIButton *) sender
{
    searchIcon.selected = NO;
    searchIcon.imageView.alpha = 0.5;
    NSLog(@"goto calendar");
    
    calendarIcon.selected = NO;
    calendarIcon.imageView.alpha = 0.5;
    
    menuIcon.selected = NO;
    menuIcon.imageView.alpha = 0.5;
    
    NSLog(@"goto search");
}

-(void) gotoMenu: (UIButton *) sender
{
    searchIcon.selected = NO;
    searchIcon.imageView.alpha = 0.5;
    NSLog(@"goto calendar");
    
    compassIcon.selected = NO;
    compassIcon.imageView.alpha = 0.5;
    
    calendarIcon.selected = NO;
    calendarIcon.imageView.alpha = 0.5;
    
    NSLog(@"goto search");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
