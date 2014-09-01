//
//  AppDelegate.h
//  iOSChallengeAnthonyTran
//
//  Created by Anthony Tran on 8/28/14.
//  Copyright (c) 2014 Anthony Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "CustomNavButton.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) CustomNavButton *searchIcon;
@property (strong, nonatomic) CustomNavButton *calendarIcon;
@property (strong, nonatomic) CustomNavButton *compassIcon;
@property (strong, nonatomic) CustomNavButton *menuIcon;





@end
