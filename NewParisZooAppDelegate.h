//
//  NewParisZooAppDelegate.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenu;

@interface NewParisZooAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainMenu *mainMenu;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainMenu *mainMenu;


@end

