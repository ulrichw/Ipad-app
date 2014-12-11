//
//  PenguinView.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 10/2/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "PenguinView.h"


@implementation PenguinView


- (void) penguinAnim{

	CGFloat widthRef   =768;
	CGFloat heightRef  =1024;
    [UIView beginAnimations:@"translatePlayer" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationDelay:0];
	self.frame = CGRectMake(1.2*heightRef,0.5*widthRef,self.image.size.width,self.image.size.height);
	[UIView setAnimationDidStopSelector:@selector(penguinAnimDone)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}


- (void) penguinAnimDone{
	
	CGFloat widthRef   =768;
	CGFloat heightRef  =1024;
    [UIView beginAnimations:@"translatePlayer2" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationDelay:0.25];
	self.frame = CGRectMake(0.9*heightRef,0.5*widthRef,self.image.size.width,self.image.size.height);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(enableAnim)];
	[UIView commitAnimations];
}
-(void) enableAnim{
    self.userInteractionEnabled=YES;
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
    self.userInteractionEnabled=NO;
	[self penguinAnim];
	
}




@end
