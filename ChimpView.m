//
//  ChimpView.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/29/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "ChimpView.h"

@implementation ChimpView
	
- (void) chimpAnim{
	
	angle = 65.0;	
	cgCTM = CGAffineTransformMakeRotation(angle*M_PI/180.);
    [UIView beginAnimations:@"rotateMonkey" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0];
    self.transform = cgCTM;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(chimpAnim1Done)];
	[UIView commitAnimations];
}

- (void) chimpAnim1Done{
	
	angle = -40.0;	
    cgCTM = CGAffineTransformMakeRotation(angle*M_PI/180.);
    [UIView beginAnimations:@"rotateMonkey2" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0];
    self.transform = cgCTM;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(chimpAnim2Done)];
	[UIView commitAnimations];
}

- (void) chimpAnim2Done{

	angle = 32.5;	
    cgCTM = CGAffineTransformMakeRotation(angle*M_PI/180.);
    [UIView beginAnimations:@"rotateMonkey3" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0];
    self.transform = cgCTM;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(chimpAnim3Done)];
	[UIView commitAnimations];
}

- (void) chimpAnim3Done{

	angle = -10.0;	
    cgCTM = CGAffineTransformMakeRotation(angle*M_PI/180.);
    [UIView beginAnimations:@"rotateMonkey4" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0];
    self.transform = cgCTM;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(chimpAnim4Done)];
	[UIView commitAnimations];
}

- (void) chimpAnim4Done{
	
	angle = 0.0;	
    cgCTM = CGAffineTransformMakeRotation(angle*M_PI/180.);
    [UIView beginAnimations:@"rotateMonkey5" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:0];
    self.transform = cgCTM;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(enableAnim)];
	[UIView commitAnimations];
}
-(void) enableAnim{
    self.userInteractionEnabled=YES;
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    self.userInteractionEnabled=NO; //to prevent repeated touches
	[self chimpAnim];
	
}


@end
