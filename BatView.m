//
//  BatView.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 10/3/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "BatView.h"


@implementation BatView

- (void) batAnim{
	
	NSMutableArray *imageArray;
	imageArray = [[NSMutableArray alloc] initWithCapacity:3];
	
	// Build array of images, cycling through image names
	[imageArray addObject:[UIImage imageNamed:@"Title_Page_Bat_closed.png"]];
	[imageArray addObject:[UIImage imageNamed:@"Title_Page_Bat_half.png"]];
	[imageArray addObject:[UIImage imageNamed:@"Title_Page_Bat_open.png"]];

	// Animate
	self.animationImages      = [NSArray arrayWithArray:imageArray];
	self.animationDuration    = 0.5;
	self.animationRepeatCount = 0;
	[self startAnimating];
	[self performSelector:@selector(stopAnimation) withObject:nil afterDelay:2];
	
	[imageArray release];	
}


-(void) stopAnimation{

	[self  stopAnimating];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
	[self batAnim];
	
}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

	UITouch *touch=[touches anyObject];
	self.center = [touch locationInView:[self superview]];
	
}



@end
