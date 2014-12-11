//
//  Game3Menu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 2/12/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "MainMenu.h"
#import "GamesMenu.h"
#import "Game3Menu.h"
#import "Messages.h"
#import "Messages2.h"
#import "BalloonRedView.h"
#import "BalloonBlueView.h"
#import "BalloonYellowView.h"
#import <QuartzCore/QuartzCore.h>
#import "Confirmation.h"

@implementation Game3Menu

@synthesize backButton,titleImage,levels,scores,imageBkng,successSound;
@synthesize caller,caller2,ballon1,ballon2,ballon3,ballon4,ballon5,ballon6;
@synthesize level,tapSound,audioButton,cloud1,cloud2,cloud3,confirmationCalled,applicationResigned;

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.multipleTouchEnabled  =YES;
    self.view.userInteractionEnabled=YES;
    
	preferences = [NSUserDefaults standardUserDefaults];
	
	winningNumber=20;
	timeInterval=5.0;
	
	//score images
    imageScore = [[NSArray alloc] initWithObjects:@"Levels_Button_0",@"Levels_Button_1",@"Levels_Button_2",@"Levels_Button_3",@"Levels_Button_4",@"Levels_Button_5",@"Levels_Button_6",@"Levels_Button_7",@"Levels_Button_8",@"Levels_Button_9",@"Levels_Button_10",@"Levels_Button_11",@"Levels_Button_12",@"Levels_Button_13",@"Levels_Button_14",@"Levels_Button_15",@"Levels_Button_16",@"Levels_Button_17",@"Levels_Button_18",@"Levels_Button_19",@"Levels_Button_20",nil];
    self.level = 1;             //we start at level 1
 
	//balloon1 to animate
	CGPoint Pa = CGPointMake(512,900); //origin balloons
    
    imageBalloon1=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_red_1" ofType:@"png"]];
    imageBalloon2=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_blue_1" ofType:@"png"]];
    imageBalloon3=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_yellow_1" ofType:@"png"]];

    ballon1 = [[BalloonRedView alloc] initWithImage:imageBalloon1];
	self.ballon1.frame  = CGRectMake(Pa.x,Pa.y,1.5*imageBalloon1.size.width,1.5*imageBalloon1.size.height);
	self.ballon1.layer.position = Pa;
	self.ballon1.alpha         = 1.0;
	self.ballon1.userInteractionEnabled = YES;
    [self.ballon1 initBalloonAnim];
    [self.ballon1 balloonAnim]; //start animating the balloon
    ballon2 = [[BalloonBlueView alloc] initWithImage:imageBalloon2];
	self.ballon2.frame  = CGRectMake(Pa.x,Pa.y,1.5*imageBalloon2.size.width,1.5*imageBalloon2.size.height);
	self.ballon2.layer.position = Pa;
	self.ballon2.alpha         = 1.0;
	self.ballon2.userInteractionEnabled = YES;
    [self.ballon2 initBalloonAnim];
    [self.ballon2 balloonAnim]; //start animating the balloon
    ballon3 = [[BalloonYellowView alloc] initWithImage:imageBalloon3];
    self.ballon3.frame  = CGRectMake(Pa.x,Pa.y,1.5*imageBalloon3.size.width,1.5*imageBalloon3.size.height);
	self.ballon3.layer.position = Pa;
	self.ballon3.alpha         = 1.0;
	self.ballon3.userInteractionEnabled = YES;
    [self.ballon3 initBalloonAnim];
    [self.ballon3 balloonAnim]; //start animating the balloon
    ballon4 = [[BalloonRedView alloc] initWithImage:imageBalloon1];
	self.ballon4.frame  = CGRectMake(Pa.x,Pa.y,imageBalloon1.size.width,imageBalloon1.size.height);
	self.ballon4.layer.position = Pa;
	self.ballon4.alpha         = 1.0;
	self.ballon4.userInteractionEnabled = YES;
    [self.ballon4 initBalloonAnim];
    [self.ballon4 balloonAnim]; //start animating the balloon
    ballon5 = [[BalloonBlueView alloc] initWithImage:imageBalloon2];
	self.ballon5.frame  = CGRectMake(Pa.x,Pa.y,imageBalloon2.size.width,imageBalloon2.size.height);
	self.ballon5.layer.position = Pa;
	self.ballon5.alpha         = 1.0;
	self.ballon5.userInteractionEnabled = YES;
    [self.ballon5 initBalloonAnim];
    [self.ballon5 balloonAnim]; //start animating the balloon
    ballon6 = [[BalloonYellowView alloc] initWithImage:imageBalloon3];
	self.ballon6.frame  = CGRectMake(Pa.x,Pa.y,imageBalloon3.size.width,imageBalloon3.size.height);
	self.ballon6.layer.position = Pa;
	self.ballon6.alpha         = 1.0;
	self.ballon6.userInteractionEnabled = YES;
    [self.ballon6 initBalloonAnim];
    [self.ballon6 balloonAnim]; //start animating the balloon
	
	numberOfBalloonsPopped = 0; //so far no balloons popped
    numberOfBalloonsMissed = 0;
    initialNumberOfBalloonsPopped = 0;

    cloudImage1=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cloud_1" ofType:@"png"]];
    cloudImage2=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cloud_2" ofType:@"png"]];
    cloudImage3=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cloud_3" ofType:@"png"]];
 
    cloud1 = [[UIImageView alloc] initWithImage:cloudImage1];
    cloud2 = [[UIImageView alloc] initWithImage:cloudImage2];
    cloud3 = [[UIImageView alloc] initWithImage:cloudImage3];
    self.cloud1.frame = CGRectMake(-400,550,cloudImage1.size.width/2.0,cloudImage1.size.height/2.0);
    self.cloud2.frame = CGRectMake(-600,400,cloudImage2.size.width/2.0,cloudImage2.size.height/2.0);
    self.cloud3.frame = CGRectMake(-800,300,cloudImage3.size.width/2.0,cloudImage3.size.height/2.0);
    self.cloud1.hidden=YES;
    self.cloud2.hidden=YES;
    self.cloud3.hidden=YES;
    [self.view addSubview:self.cloud1];
    [self.view addSubview:self.cloud2];
    [self.view addSubview:self.cloud3];

	//create sound of popping balloon
    self.tapSound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Balloon Popping-SoundBible.com-1247261379" ofType: @"mp3"]];
	//create sound of successful piece
    self.successSound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"applause2_x" ofType: @"mp3"]];
    
	//set the appropriate title image (in English or French)
    if([preferences boolForKey:@"language"]) //if it's in English
	{
        titleImageFrEn =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Balloon_Pop_Title" ofType:@"png"]];
        imageLevelFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_button_Level" ofType:@"png"]];
    }else{
        titleImageFrEn =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Balloon_Pop_Title" ofType:@"png"]];
        imageLevelFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_button_Level" ofType:@"png"]];
    }
    
    [self.titleImage setImage:titleImageFrEn];
    [self.scores     setImage:imageLevelFrEn];

	[self.caller     setImageForAudioButtons];

    self.confirmationCalled = NO;
    buttonToAnimate=nil;
 
    nullImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NULL" ofType:@"png"]];
    
    BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sky_bkgd" ofType:@"jpg"]];
    [self.imageBkng setImage:BKGDImage];
    
    isInitialized = 1001;
    self.applicationResigned = NO;
    
    self.backButton.exclusiveTouch=YES;
	self.audioButton.exclusiveTouch=YES;

}

- (void) changeTitleLanguage: (BOOL) inEnglish{
	
    if(isInitialized == 1001){
        
        [titleImageFrEn release];
        [imageLevelFrEn release];
        [BKGDImage      release];

	if(inEnglish) //if it's in English
	{
        titleImageFrEn =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Balloon_Pop_Title" ofType:@"png"]];
        imageLevelFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_button_Level" ofType:@"png"]];
    }
	else{
        titleImageFrEn =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Balloon_Pop_Title" ofType:@"png"]];
        imageLevelFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_button_Level" ofType:@"png"]];        
	}
        [self.titleImage setImage:titleImageFrEn];
        [self.scores     setImage:imageLevelFrEn];
        BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sky_bkgd" ofType:@"jpg"]];
        [self.imageBkng setImage:BKGDImage];
    }
		
}

- (void) startCloudTimer{
    if(!cloudTimer)
    {
        cloudTimer = [NSTimer scheduledTimerWithTimeInterval:7.6 target:self selector:@selector(flyClouds) userInfo:nil repeats:YES];
    }
}

- (void) flyBalloons{
	
	float speed;
	CGPoint Pa,Pa2,Pa3,Pa4,Pa5,Pa6;
	
	speed= timeInterval-self.level*2.0/winningNumber-0.35;
	//if(speed > timeInterval-0.25) speed=timeInterval-0.25; //to let 1 sec for the code to execute countBalloonsPopped after the end of animation and before the timer restart
	
	Pa.x = arc4random() % 820 + 50;
	Pa.y = 900;
	self.ballon1.layer.position = Pa;
	Pa.x = arc4random() % 820 + 50;
	Pa.y = 900;
	self.ballon2.layer.position = Pa;
	Pa.x = arc4random() % 820 + 50;
	Pa.y = 950;
	self.ballon3.layer.position = Pa;
	Pa.x = arc4random() % 820 + 50;
	Pa.y = 950;
	self.ballon4.layer.position = Pa;
	Pa.x = arc4random() % 820 + 50;
	Pa.y = 1000;
	self.ballon5.layer.position = Pa;
	Pa.x = arc4random() % 820 + 50;
	Pa.y = 1050;
	self.ballon6.layer.position = Pa;
		
	Pa.x  = arc4random() % 820 + 50;
	Pa.y  = -200;
	Pa2.x = arc4random() % 820 + 50;
	Pa2.y = -300;
	Pa3.x = arc4random() % 820 + 50;
	Pa3.y = -300;
	Pa4.x = arc4random() % 820 + 50;
	Pa4.y = -350;
	Pa5.x = arc4random() % 820 + 50;
	Pa5.y = -350;
	Pa6.x = arc4random() % 820 + 50;
	Pa6.y = -400;
	
	initialNumberOfBalloonsPopped = numberOfBalloonsPopped;
    numberOfBalloonsMissed = 0;
    if(self.level == 1) numberOfFlyingBalloons=1;
    if(self.level == 2) numberOfFlyingBalloons=2;
    if(self.level == 3) numberOfFlyingBalloons=3;
    if(self.level == 4) numberOfFlyingBalloons=4;
    if(self.level == 5) numberOfFlyingBalloons=5;
    if(self.level == 6) numberOfFlyingBalloons=6;
    if(self.level >  6) numberOfFlyingBalloons=6;
    
    if(!(self.ballon1.superview))[self.view addSubview:self.ballon1];
    if(!(self.ballon2.superview))[self.view addSubview:self.ballon2];
    if(!(self.ballon3.superview))[self.view addSubview:self.ballon3];
    if(!(self.ballon4.superview))[self.view addSubview:self.ballon4];
    if(!(self.ballon5.superview))[self.view addSubview:self.ballon5];
    if(!(self.ballon6.superview))[self.view addSubview:self.ballon6];
        
	[UIView beginAnimations:@"movingBalloon" context:nil];
	[UIView setAnimationDuration:speed];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDelegate:self];
    self.ballon1.layer.position = Pa;
	if(numberOfFlyingBalloons >=2) self.ballon2.layer.position = Pa2;
	if(numberOfFlyingBalloons >=3) self.ballon3.layer.position = Pa3;
	if(numberOfFlyingBalloons >=4) self.ballon4.layer.position = Pa4;
	if(numberOfFlyingBalloons >=5) self.ballon5.layer.position = Pa5;
	if(numberOfFlyingBalloons >=6) self.ballon6.layer.position = Pa6;
	[UIView setAnimationDidStopSelector:@selector(countBalloonsPopped)];
	[UIView commitAnimations];
}

- (void) flyClouds{

    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    CGPoint Pa,Pa2,Pa3;

    int x0 = arc4random() % 100;
    int x1 = arc4random() % 100;
    int x2 = arc4random() % 100;
    
    Pa.x=-300+x0;
    Pa.y=550;
    self.cloud1.layer.position=Pa;
    Pa2.x=-500-x1;
    Pa2.y=400;
    self.cloud2.layer.position=Pa2;
    Pa3.x=-700-x2;
    Pa3.y=350;
    self.cloud3.layer.position=Pa3;
    self.cloud1.alpha = 0.5;
    self.cloud2.alpha = 0.5;
    self.cloud3.alpha = 0.5;
    Pa.x=1250;
    Pa.y=550;
    Pa2.x=1250;
    Pa2.y=400;
    Pa3.x=1250;
    Pa3.y=350;
    self.cloud1.hidden=NO;
    self.cloud2.hidden=NO;
    self.cloud3.hidden=NO;

  	[UIView beginAnimations:@"movingClouds" context:nil];
	[UIView setAnimationDuration:7.5];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	[UIView setAnimationDelegate:self];
    self.cloud1.layer.position=Pa;
    self.cloud2.layer.position=Pa2;
    self.cloud3.layer.position=Pa3;
    self.cloud1.alpha = (float)(arc4random() % 100)/100.;
    self.cloud2.alpha = (float)(arc4random() % 100)/100.;
    self.cloud3.alpha = (float)(arc4random() % 100)/100.;
    self.cloud1.transform = CGAffineTransformScale(affineTransform,(float)(arc4random()%100)/250.+0.8,(float)(arc4random()%100)/250.+0.8);
    self.cloud2.transform = CGAffineTransformScale(affineTransform,(float)(arc4random()%100)/250.+0.8,(float)(arc4random()%100)/250.+0.8);
    self.cloud3.transform = CGAffineTransformScale(affineTransform,(float)(arc4random()%100)/250.+0.8,(float)(arc4random()%100)/250.+0.8);
    [UIView commitAnimations];
}

- (void) countBalloonsPopped {
	
	int success = 0;
    
    if(!self.applicationResigned)
    {
	       
    numberOfBalloonsMissed = numberOfFlyingBalloons-(numberOfBalloonsPopped-initialNumberOfBalloonsPopped);
    if(numberOfBalloonsMissed == 0) //to increase level, no balloons must have been missed this round
         {
             if(self.level == 1  && numberOfBalloonsPopped     >= 3) success = 1;
             if(self.level == 2  && numberOfBalloonsPopped-3   >= 6) success = 1;
             if(self.level == 3  && numberOfBalloonsPopped-9   >= 9) success = 1;
             if(self.level == 4  && numberOfBalloonsPopped-18  >=16) success = 1;
             if(self.level == 5  && numberOfBalloonsPopped-34  >=20) success = 1;
             if(self.level == 6  && numberOfBalloonsPopped-54  >=30) success = 1;
             if(self.level == 7  && numberOfBalloonsPopped-84  >=30) success = 1;
             if(self.level == 8  && numberOfBalloonsPopped-114 >=30) success = 1;
             if(self.level == 9  && numberOfBalloonsPopped-144 >=36) success = 1;
             if(self.level == 10 && numberOfBalloonsPopped-180 >=36) success = 1;
             if(self.level == 11 && numberOfBalloonsPopped-215 >=36) success = 1;
             if(self.level == 12 && numberOfBalloonsPopped-252 >=36) success = 1;
             if(self.level == 13 && numberOfBalloonsPopped-288 >=36) success = 1;
             if(self.level == 14 && numberOfBalloonsPopped-324 >=36) success = 1;
             if(self.level == 15 && numberOfBalloonsPopped-360 >=36) success = 1;
             if(self.level == 16 && numberOfBalloonsPopped-396 >=36) success = 1;
             if(self.level == 17 && numberOfBalloonsPopped-432 >=36) success = 1;
             if(self.level == 18 && numberOfBalloonsPopped-468 >=36) success = 1;
             if(self.level == 19 && numberOfBalloonsPopped-504 >=36) success = 1;
             if(self.level == 20 && numberOfBalloonsPopped-540 >=36) success = 1;
         }
    else
         {
             self.caller.messages2.caller = self;
             [self.caller.messages2 createMessages];
             [self startOverCalled];
         }

    if(success)
         {
             self.level += 1;
             [imageScoreI release];
             imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.level] ofType:@"png"]];
             [self.levels setImage:imageScoreI];
             if(self.level == winningNumber)
             {
                 if([preferences boolForKey:@"audio"])
                 {
                     [player stop];
                     [player release];
                     player=nil;
                     player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.successSound error:&error];
                     player.delegate=(id)self;
                     player.volume = 1.0f;
                     if([player prepareToPlay])[player play];
                 }
                 [myTimer invalidate];
                 myTimer=nil;
                 CGFloat widthRef ;
                 CGFloat heightRef;
                 widthRef   =768;
                 heightRef  =1024;
                 image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Message_Bravo" ofType:@"png"]];
                 bravoImage= [[UIImageView alloc] initWithImage:image];
                 bravoImage.frame = CGRectMake(heightRef/2.-image.size.width*1.25,780,image.size.width*2.5,image.size.height*2.5);
                 bravoImage.alpha=1.0;
                 [self.view addSubview:bravoImage];
                 [UIView beginAnimations:@"victory" context:nil];
                 [UIView setAnimationDuration:5.5];
                 [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                 bravoImage.frame = CGRectMake(heightRef/2.-image.size.width*1.25,widthRef/2.-image.size.height*1.25,image.size.width*2.5,image.size.height*2.5);
                 [UIView setAnimationDidStopSelector:@selector(victoryDone)];
                 [UIView setAnimationDelegate:self];
                 [UIView commitAnimations];
             } else{
                 self.caller.messages.caller = self;
                 [self.caller.messages createMessages];
             }
         }
    }
    self.applicationResigned=NO;
}


- (void) victoryDone{
    [bravoImage removeFromSuperview];
    [bravoImage release];
    [image release];
    bravoImage=nil;
    image=nil;
    self.applicationResigned=NO;
    [self startOverCalled];
}

-(void) startOverCalled{
 	if(self.ballon1.superview)  [self.ballon1 removeFromSuperview];
	if(self.ballon2.superview)	[self.ballon2 removeFromSuperview];
	if(self.ballon3.superview)	[self.ballon3 removeFromSuperview];
	if(self.ballon4.superview)	[self.ballon4 removeFromSuperview];
	if(self.ballon5.superview)	[self.ballon5 removeFromSuperview];
	if(self.ballon6.superview)	[self.ballon6 removeFromSuperview];
    [myTimer invalidate];
	myTimer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(flyBalloons) userInfo:nil repeats:YES];
	self.level = 1;
	numberOfBalloonsPopped = 0;
    numberOfBalloonsMissed = 0;
    [imageScoreI release];
    imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.level] ofType:@"png"]];
    [self.levels setImage:imageScoreI];
    [self enableAllButtons];
}

- (void) doneWithMessage{
    //nothing happens!
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


- (IBAction) backButtonClicked{
    self.backButton.userInteractionEnabled=NO;
    buttonToAnimate=self.backButton;
    [player stop];
    [player release];
    player=nil;
    [self animateView];
}
-(void) endAnimationButtonBack{
    self.confirmationCalled=YES;
    self.caller.confirmation.start=NO; //we do not want to start over, we want to exit the game
    self.caller.confirmation.caller = self;
    self.applicationResigned=YES;
    [self.caller.confirmation createConfirmation];
}
-(void) enableAllButtons{
    self.backButton.userInteractionEnabled=YES;
}
-(void) confirmationCalled:(BOOL)isCalled withExit:(BOOL)exiting{
    self.confirmationCalled = isCalled;
    if(exiting)
    {
        [myTimer invalidate];
        myTimer=nil;
        [cloudTimer invalidate];
        cloudTimer=nil;
        self.level = 1;
        numberOfBalloonsPopped = 0;
        numberOfBalloonsMissed = 0;
        [imageScoreI release];
        imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.level] ofType:@"png"]];
        [self.levels setImage:imageScoreI];
        [BKGDImage release];
        BKGDImage=nil;
        [self.imageBkng setImage:nullImage];
    }
}

-(void) pauseTimers{
    pauseStart        = [[NSDate date] retain];
    previousFireDate1 = [[myTimer fireDate] retain];
    previousFireDate2 = [[cloudTimer fireDate] retain];
 
    [myTimer    setFireDate:[NSDate distantFuture]];
    [cloudTimer setFireDate:[NSDate distantFuture]];
}

-(void) resumeTimers{
    
    float pauseTime = -1*[pauseStart timeIntervalSinceNow]; //how manys seconds did the pause last
    
    [myTimer    setFireDate:[NSDate dateWithTimeInterval:pauseTime sinceDate:previousFireDate1]];
    [cloudTimer setFireDate:[NSDate dateWithTimeInterval:pauseTime sinceDate:previousFireDate2]];
    
    [pauseStart release];
    [previousFireDate1 release];
    [previousFireDate2 release];
}

-(void)pauseLayers{

    CALayer *layer=self.view.layer;
    
    CFTimeInterval paused_time = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0f;
    layer.timeOffset = paused_time;
}

-(void)resumeLayers{

    CALayer *layer=self.view.layer;
    
    CFTimeInterval paused_time = [layer timeOffset];
    layer.speed = 1.0f;
    layer.timeOffset = 0.0f;
    layer.beginTime = 0.0f;
    CFTimeInterval time_since_pause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - paused_time;
    layer.beginTime = time_since_pause;
}

- (void)applicationWillResignActive{
    [myTimer invalidate];
    myTimer=nil;
	[cloudTimer invalidate];
    cloudTimer=nil;
    self.level = 1;
    numberOfBalloonsPopped = 0;
    numberOfBalloonsMissed = 0;
    self.applicationResigned=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    if(self.confirmationCalled)[self.caller.confirmation touchesBegan:touches withEvent:event];
    else{

    int success=0;
	UITouch *touch = [touches anyObject];
    CGPoint point  = [touch locationInView:self.view];
    
    CGPoint presentationPosition  = [(CALayer *)[self.ballon1.layer presentationLayer] position];
    CGPoint presentationPosition2 = [(CALayer *)[self.ballon2.layer presentationLayer] position];
    CGPoint presentationPosition3 = [(CALayer *)[self.ballon3.layer presentationLayer] position];
    CGPoint presentationPosition4 = [(CALayer *)[self.ballon4.layer presentationLayer] position];
    CGPoint presentationPosition5 = [(CALayer *)[self.ballon5.layer presentationLayer] position];
    CGPoint presentationPosition6 = [(CALayer *)[self.ballon6.layer presentationLayer] position];

    if(self.ballon1.superview)
    {
        if (point.x > presentationPosition.x-0.5*imageBalloon1.size.width && point.x < presentationPosition.x+0.5*imageBalloon1.size.width
            && point.y > presentationPosition.y-0.5*imageBalloon1.size.height && point.y < presentationPosition.y+0.5*imageBalloon1.size.height)
        {
            [self.ballon1 removeFromSuperview];
            success=1;
            goto endSection;
        }
    }
    if(self.ballon2.superview)
    {
        if (point.x > presentationPosition2.x-0.5*imageBalloon2.size.width && point.x < presentationPosition2.x+0.5*imageBalloon2.size.width
		&& point.y > presentationPosition2.y-0.5*imageBalloon2.size.height && point.y < presentationPosition2.y+0.5*imageBalloon2.size.height)
        {
            [self.ballon2 removeFromSuperview];
            success=1;
            goto endSection;
        }
    }
    if(self.ballon3.superview)
    {
        if (point.x > presentationPosition3.x-0.5*imageBalloon3.size.width && point.x < presentationPosition3.x+0.5*imageBalloon3.size.width
		&& point.y > presentationPosition3.y-0.5*imageBalloon3.size.height && point.y < presentationPosition3.y+0.5*imageBalloon3.size.height)
        {
            [self.ballon3 removeFromSuperview];
            success=1;
            goto endSection;
        }
    }
    if(self.ballon4.superview)
    {
        if (point.x > presentationPosition4.x-0.5*imageBalloon1.size.width && point.x < presentationPosition4.x+0.5*imageBalloon1.size.width
        && point.y > presentationPosition4.y-0.5*imageBalloon1.size.height && point.y < presentationPosition4.y+0.5*imageBalloon1.size.height)
        {
            [self.ballon4 removeFromSuperview];
            success=1;
            goto endSection;
        }
    }
    if(self.ballon5.superview)
    {
        if (point.x > presentationPosition5.x-0.5*imageBalloon2.size.width && point.x < presentationPosition5.x+0.5*imageBalloon2.size.width
		&& point.y > presentationPosition5.y-0.5*imageBalloon2.size.height && point.y < presentationPosition5.y+0.5*imageBalloon2.size.height)
        {
            [self.ballon5 removeFromSuperview];
            success=1;
            goto endSection;
        }
	}
    if(self.ballon6.superview)
    {
        if (point.x > presentationPosition6.x-0.5*imageBalloon3.size.width && point.x < presentationPosition6.x+0.5*imageBalloon3.size.width
		&& point.y > presentationPosition6.y-0.5*imageBalloon3.size.height && point.y < presentationPosition6.y+0.5*imageBalloon3.size.height)
        {
            [self.ballon6 removeFromSuperview];
            success=1;
            goto endSection;
        }
    }
endSection:
    if(success){
    numberOfBalloonsPopped +=1;
    if([preferences boolForKey:@"audio"])
    {
        [player stop];
        [player release];
        player=nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.tapSound error:&error];
        player.delegate=(id)self;
        player.volume = 1.0f;
        if([player prepareToPlay])[player play];
    }
    }
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (IBAction) buttonAudioClicked: (id) sender{
	
	[self.caller buttonAudioClicked:sender];
}

- (void) animateView{
    
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"buttonTouched" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    buttonToAnimate.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    [UIView setAnimationDidStopSelector:@selector(animateViewDone)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

- (void) animateViewDone{
    
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
	[UIView beginAnimations:@"buttonTouchedDone" context:nil];
	[UIView setAnimationDuration:0.15];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
    buttonToAnimate.transform = CGAffineTransformScale(affineTransform,1.0,1.0);
    if([buttonToAnimate isEqual:self.backButton]) [UIView setAnimationDidStopSelector:@selector(endAnimationButtonBack)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

- (void)viewDidUnload {
	
	self.backButton  = nil;
	self.titleImage  = nil;
	self.ballon1     = nil;
	self.ballon2     = nil;
	self.ballon3     = nil;
	self.ballon4     = nil;
	self.ballon5     = nil;
	self.ballon6     = nil;
	self.levels      = nil;
	self.scores      = nil;
	self.audioButton = nil;
    self.cloud1      = nil;
    self.cloud2      = nil;
    self.cloud3      = nil;
    self.tapSound    = nil;
    self.successSound= nil;
    [imageScore     release];
    imageScore       = nil;
    [imageScoreI    release];
    imageScoreI      = nil;
    [titleImageFrEn release];
	titleImageFrEn   = nil;
    [imageBalloon1  release];
    imageBalloon1    = nil;
    [imageBalloon2  release];
    imageBalloon2    = nil;
    [imageBalloon3  release];
    imageBalloon3    = nil;
    [cloudImage1    release];
    cloudImage1      = nil;
    [cloudImage2    release];
    cloudImage2      = nil;
    [cloudImage3    release];
    cloudImage3      = nil;
    [imageLevelFrEn release];
    imageLevelFrEn   = nil;
    isInitialized    = 0;
    [nullImage      release];
    [BKGDImage      release];
    nullImage        = nil;
    BKGDImage        = nil;
    self.imageBkng   = nil;
    //[player release];
    //player=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
		
	[caller      release];
	[caller2     release];
	[ballon1     release];
	[ballon2     release];
	[ballon3     release];
	[ballon4     release];
	[ballon5     release];
	[ballon6     release];
    [cloud1      release];
    [cloud2      release];
    [cloud3      release];
	[backButton  release];
	[titleImage  release];
	[levels      release];
	[myTimer     invalidate];
    [cloudTimer  invalidate];
	[myTimer     release];
	[tapSound    release];
	[scores      release];
	[audioButton release];
    [imageScore  release];
    [imageScoreI release];
	[titleImageFrEn release];
    [player         release];
    [imageBalloon1  release];
    [imageBalloon2  release];
    [imageBalloon3  release];
    [cloudImage1    release];
    [cloudImage2    release];
    [cloudImage3    release];
    [pauseStart     release];
    [previousFireDate1 release];
    [previousFireDate2 release];
    [imageLevelFrEn release];
    [nullImage     release];
    [BKGDImage     release];
    [imageBkng     release];
    [successSound  release];
    [bravoImage    release];
    [image         release];
    [super dealloc];
}


@end
