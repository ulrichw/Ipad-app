//
//  Confirmation.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 4/7/13.
//
//

#import "Confirmation.h"
#import <QuartzCore/QuartzCore.h>

@implementation Confirmation

@synthesize start,caller;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    preferences = [NSUserDefaults standardUserDefaults];

    widthRef   =768;
	heightRef  =1024;

    confirmationDisplayed=0;
    
    englishConfirmation=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_AreYouSure_English" ofType:@"png"]];
    frenchConfirmation=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_AreYouSure_French" ofType:@"png"]];
    
    englishImage=[[UIImageView alloc] initWithImage:englishConfirmation];
    frenchImage =[[UIImageView alloc] initWithImage:frenchConfirmation];    
}

- (void) createConfirmation{
    
    if(!confirmationDisplayed)
    {
        confirmationDisplayed = 1;
        CGRect newFrame;
                
        if([preferences boolForKey:@"language"])
        {
            englishImage.frame = CGRectMake(heightRef/2.-englishConfirmation.size.width/4.,widthRef/2.-englishConfirmation.size.height/4.,englishConfirmation.size.width/2.,englishConfirmation.size.height/2.);
            newFrame = englishImage.frame;
            newFrame.size.width  *= 2.;
            newFrame.size.height *= 2.;
            newFrame.origin.x     = heightRef/2. -newFrame.size.width/2.;
            newFrame.origin.y     = widthRef/2.  -newFrame.size.height/2.;
            englishImage.alpha  = 0.0;
            [[self.caller view] addSubview:englishImage];
            [[self.caller view] bringSubviewToFront:englishImage];
        }
        else
        {
            frenchImage.frame = CGRectMake(heightRef/2.-frenchConfirmation.size.width/4.,widthRef/2.-frenchConfirmation.size.height/4.,frenchConfirmation.size.width/2.,frenchConfirmation.size.height/2.);
            newFrame = frenchImage.frame;
            newFrame.size.width  *= 2.;
            newFrame.size.height *= 2.;
            newFrame.origin.x     = heightRef/2. -newFrame.size.width/2.;
            newFrame.origin.y     = widthRef/2.  -newFrame.size.height/2.;
            frenchImage.alpha  = 0.0;
            [[self.caller view] addSubview:frenchImage];
            [[self.caller view] bringSubviewToFront:frenchImage];
        }
        
        [UIView beginAnimations:@"DisplayConfirmation" context:nil];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        if([preferences boolForKey:@"language"])
        {
            englishImage.alpha=1.0;
            englishImage.frame=newFrame;
        }
        else 
        {
            frenchImage.alpha=1.0;
            frenchImage.frame=newFrame;
        }
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(pauseAnimations)];
        [UIView commitAnimations];
    }
}

-(void) pauseAnimations{
    [self.caller pauseLayers];
    [self.caller pauseTimers];
}

- (void) clickConfirmation: (BOOL)exit{
    [self.caller resumeLayers];
    [self.caller resumeTimers];
    
    CGRect newFrame;
    
    if([preferences boolForKey:@"language"])
    {
        englishImage.frame = CGRectMake(heightRef/2.-englishConfirmation.size.width/4.,widthRef/2.-englishConfirmation.size.height/4.,englishConfirmation.size.width/2.,englishConfirmation.size.height/2.);
        newFrame = englishImage.frame;
        newFrame.size.width  *= .1;
        newFrame.size.height *= .1;
        newFrame.origin.x     = heightRef/2. -newFrame.size.width/2.;
        newFrame.origin.y     = widthRef/2.  -newFrame.size.height/2.;
    }
    else
    {
        frenchImage.frame = CGRectMake(heightRef/2.-frenchConfirmation.size.width/4.,widthRef/2.-frenchConfirmation.size.height/4.,frenchConfirmation.size.width/2.,frenchConfirmation.size.height/2.);
        newFrame = frenchImage.frame;
        newFrame.size.width  *= .1;
        newFrame.size.height *= .1;
        newFrame.origin.x     = heightRef/2. -newFrame.size.width/2.;
        newFrame.origin.y     = widthRef/2.  -newFrame.size.height/2.;        
    }

    
    [UIView beginAnimations:@"RemoveConfirmation" context:nil];
	[UIView setAnimationDuration:0.25];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if([preferences boolForKey:@"language"])
    {
        englishImage.alpha=0.0;
        englishImage.frame=newFrame;
    }
    else
    {
        frenchImage.alpha=0.0;
        frenchImage.frame=newFrame;
    }
	[UIView setAnimationDelegate:self];
    if( exit &&  self.start == NO) [UIView setAnimationDidStopSelector:@selector(exitGame)];
    if(!exit &&  self.start == NO) [UIView setAnimationDidStopSelector:@selector(noExitGame)];
    if( exit &&  self.start) [UIView setAnimationDidStopSelector:@selector(startOver)];
    if(!exit &&  self.start) [UIView setAnimationDidStopSelector:@selector(noStartOver)];
    [UIView commitAnimations];
    
}

- (void) exitGame{

    confirmationDisplayed=0;
    [(id <commonGamesMethods>)self.caller confirmationCalled:NO withExit:YES];
	[(id <commonGamesMethods>)self.caller enableAllButtons];
    
    [UIView beginAnimations:@"exitGame" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[[self.caller view] superview] cache:NO];
	[[self.caller view] removeFromSuperview];
    if([preferences boolForKey:@"language"]) [englishImage removeFromSuperview];
    else [frenchImage  removeFromSuperview];
	[UIView commitAnimations];
}

- (void) noExitGame{

    confirmationDisplayed=0;
    [(id <commonGamesMethods>)self.caller confirmationCalled:NO withExit:NO];
	[(id <commonGamesMethods>)self.caller enableAllButtons];
}

- (void) startOver{

    confirmationDisplayed=0;
    [(id <commonGamesMethods>)self.caller confirmationCalled:NO withExit:NO];
    [(id <commonGamesMethods>)self.caller startOverCalled];
}

- (void) noStartOver{
    
    confirmationDisplayed=0;
    [(id <commonGamesMethods>)self.caller confirmationCalled:NO withExit:NO];
	[(id <commonGamesMethods>)self.caller enableAllButtons];
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
	UITouch *touch = [touches anyObject];
    CGPoint point;  
    
    if([preferences boolForKey:@"language"])
    {
        point = [touch locationInView:englishImage];
        if (point.x > 34 && point.x < 198 && point.y > 70 && point.y < 113)
        {
            [self clickConfirmation:NO];
        }
        if (point.x > 225 && point.x < 363 && point.y > 70 && point.y < 113)
        {
            [self clickConfirmation:YES];
        }
    }
    else
    {
        point = [touch locationInView:frenchImage];
        if (point.x > 34 && point.x < 198 && point.y > 70 && point.y < 113)
        {
            [self clickConfirmation:NO];
        }
        if (point.x > 225 && point.x < 363 && point.y > 70 && point.y < 113)
        {
            [self clickConfirmation:YES];
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewDidUnload{
    [englishConfirmation release];
    [frenchConfirmation release];
    [englishImage release];
    [frenchImage  release];
    //self.caller=nil;
    englishConfirmation=nil;
    frenchConfirmation=nil;
    englishImage=nil;
    frenchImage=nil;
}

- (void) dealloc{
    
    [englishConfirmation release];
    [frenchConfirmation release];
    [englishImage release];
    [frenchImage  release];
    [caller release];
    [super dealloc];
    
}

@end
