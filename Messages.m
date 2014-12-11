    //
//  Messages.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 11/3/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "Messages.h"
#import <QuartzCore/QuartzCore.h>

@implementation Messages

@synthesize caller;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	preferences = [NSUserDefaults standardUserDefaults];
	
	listOfFrenchMessages  = [[[NSArray alloc] initWithObjects:@"French_Message_victoire",@"French_Message_Super",@"French_Message_BienJoue",@"French_Message_Felicitations",@"French_Message_Bravo",@"French_Message_BonTravail",@"French_Message_Incroyable",nil] retain];
	listOfEnglishMessages = [[[NSArray alloc] initWithObjects:@"English_Message_Super",@"English_Message_Success",@"English_Message_WellDone",@"English_Message_GoodJob",@"English_Message_Great",@"English_Message_Amazing",@"English_Message_Incredible",nil]   retain];

	widthRef   =768;
	heightRef  =1024;
	
	messageDisplayed=0;
	image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfEnglishMessages objectAtIndex:0] ofType:@"png"]];
	imageF= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfFrenchMessages objectAtIndex:0] ofType:@"png"]];

    englishMessage= [[UIImageView alloc] initWithImage:image];
    frenchMessage = [[UIImageView alloc] initWithImage:imageF];

}

- (void) createMessages {
	
if(!messageDisplayed) 
{
	messageDisplayed = 1;
	CGRect newFrame;
	
	choice = arc4random() % nMessages;
	
	if([preferences boolForKey:@"language"])
	{
        [image release];
        image=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfEnglishMessages objectAtIndex:choice] ofType:@"png"]];
        [englishMessage setImage:image];
		englishMessage.frame = CGRectMake(heightRef/2.-image.size.width/4.,widthRef/2.-image.size.height/4.,image.size.width/2.,image.size.height/2.);
		newFrame = englishMessage.frame;
		newFrame.size.width  *= 2.;
		newFrame.size.height *= 2.;
		newFrame.origin.x     = heightRef/2. -newFrame.size.width/2.;
		newFrame.origin.y     = widthRef/2.  -newFrame.size.height/2.;
		englishMessage.alpha  = 0.0;	
		[[(UIViewController *)self.caller view] addSubview:englishMessage];
		[[(UIViewController *)self.caller view] bringSubviewToFront:englishMessage];
	}
	else 
	{
        [imageF release];
        imageF=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfFrenchMessages objectAtIndex:choice] ofType:@"png"]];
        [frenchMessage setImage:imageF];
		frenchMessage.frame = CGRectMake(heightRef/2.-imageF.size.width/4.,widthRef/2.-imageF.size.height/4.,imageF.size.width/2.,imageF.size.height/2.);
        newFrame = frenchMessage.frame;
		newFrame.size.width  *= 2.;
		newFrame.size.height *= 2.;		
		newFrame.origin.x     = heightRef/2. -newFrame.size.width/2.;
		newFrame.origin.y     = widthRef/2.-newFrame.size.height/2.;
		frenchMessage.alpha   = 0.0;
		[[(UIViewController *)self.caller view] addSubview:frenchMessage];
		[[(UIViewController *)self.caller view] bringSubviewToFront:frenchMessage];
	}

	
	[UIView beginAnimations:@"DisplayMessages" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	if([preferences boolForKey:@"language"])
	{
		englishMessage.alpha=1.0;
		englishMessage.frame=newFrame;
	}
	else 
	{
		frenchMessage.alpha=1.0;
		frenchMessage.frame=newFrame;		
	}
	[UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(killMessages)];
	[UIView commitAnimations];
	
}
}


-(void) killMessages{
	[UIView beginAnimations:@"RemoveMessages" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    englishMessage.alpha=0.0;
    frenchMessage.alpha=0.0;
	[UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(releaseMessages)];
	[UIView commitAnimations];
}

-(void) releaseMessages{
    [englishMessage removeFromSuperview];
    [frenchMessage removeFromSuperview];
	messageDisplayed=0;
	[(id <commonMessagesMethods>)self.caller doneWithMessage];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewDidUnload {
	
	[listOfFrenchMessages  release];
	[listOfEnglishMessages release];
	//self.caller = nil;
	listOfFrenchMessages = nil;
	listOfEnglishMessages= nil;
    [image  release];
	[imageF release];
    image =nil;
    imageF=nil;
    [englishMessage release];
    [frenchMessage release];
    englishMessage=nil;
    frenchMessage=nil;
    [super viewDidUnload];
}


- (void)dealloc {
	[listOfFrenchMessages  release];
	[listOfEnglishMessages release];
	[caller release];
    [image release];
	[imageF release];
    [englishMessage release];
    [frenchMessage release];
    [super dealloc];
}


@end
