//
//  Messages.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 11/3/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "commonMessagesMethods.h"

#define nMessages 7

@interface Messages : UIViewController {
	
	NSArray *listOfFrenchMessages;
	NSArray *listOfEnglishMessages;
	
	UIImageView *frenchMessage;
	UIImageView *englishMessage;

	UIImage *image;
	UIImage *imageF;
	
	CGFloat widthRef ;
	CGFloat heightRef;
	
	int choice;

	int messageDisplayed;
	
	NSUserDefaults *preferences;

	id <commonMessagesMethods> caller;
}

@property (nonatomic,retain) id <commonMessagesMethods> caller;
		   
- (void) createMessages;
- (void) killMessages;
- (void) releaseMessages;

@end
