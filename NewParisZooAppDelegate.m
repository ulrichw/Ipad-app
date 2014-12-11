//
//  NewParisZooAppDelegate.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "NewParisZooAppDelegate.h"
#import "MainMenu.h"
#import "Game2Menu.h"
#import "Game3Menu.h"

@implementation NewParisZooAppDelegate

@synthesize window;
@synthesize mainMenu;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    //[window addSubview:self.mainMenu.view]; DOES NOT WORK ON iOS 6
    [window setRootViewController:self.mainMenu];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
	[self.mainMenu.game2Menu stopSoundClicked]; //to make sure the animal sound stops when the user presses the home button
    [self.mainMenu.game3Menu applicationWillResignActive];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    self.mainMenu.game3Menu.applicationResigned=YES;
    if(self.mainMenu.game3Menu.view.superview)
    {
        [self.mainMenu.game3Menu startCloudTimer];
        [self.mainMenu.game3Menu startOverCalled];
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[mainMenu release];
    [window release];
    [super dealloc];
}


@end
