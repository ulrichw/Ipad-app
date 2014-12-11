//
//  BalloonView.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 10/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "BalloonView.h"


@implementation BalloonView


- (void) balloonAnim{
	
	CGFloat heightRef  =1024;
	CGRect temp=self.frame;
	[UIView beginAnimations:@"movingBalloon" context:nil];
	[UIView setAnimationDelay:0.0];
	[UIView setAnimationDuration:0.85];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	temp.origin.y=temp.origin.y-0.5*heightRef;
	self.frame = CGRectMake(temp.origin.x,temp.origin.y,temp.size.width,temp.size.height);
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(balloonAnimDone)];
	[UIView commitAnimations];
}

- (void) balloonAnimDone{
	
	CGFloat heightRef  =1024;
	CGRect temp=self.frame;
	self.alpha=0.0;
	[UIView beginAnimations:@"poppingBalloon" context:nil];
	[UIView setAnimationDelay:0.0];
	[UIView setAnimationDuration:0.01];
	temp.origin.y=temp.origin.y+0.5*heightRef;
	self.frame = CGRectMake(temp.origin.x,temp.origin.y,temp.size.width,temp.size.height);	
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(balloonAnimDone2)];
	[UIView commitAnimations];
}

- (void) balloonAnimDone2{
		
	[UIView beginAnimations:@"poppingBalloon2" context:nil];
	[UIView setAnimationDelay:0.0];
	[UIView setAnimationDuration:0.65];
	self.alpha=1.0;
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(enableAnim)];
    [UIView commitAnimations];
}
-(void) enableAnim{
    self.userInteractionEnabled=YES;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
    self.userInteractionEnabled=NO;
	[self balloonAnim];
	
}

@end
