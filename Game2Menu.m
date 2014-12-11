//
//  Game2Menu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 2/5/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "MainMenu.h"
#import "GamesMenu.h"
#import "Game2Menu.h"
#import "Messages.h"
#import "Messages2.h"
#import "Confirmation.h"

@implementation Game2Menu

@synthesize backButton,titleImage,playSound,startOver,scoreView;
@synthesize caller,caller2,listOfAnimals,successSound,confirmationCalled;
@synthesize animalView1, animalView2, animalView3,score,imageBkng;

- (void)viewDidLoad {

    [super viewDidLoad];
	
	int i;
	
    preferences = [NSUserDefaults standardUserDefaults];
    
	self.score = 0;
	maxScore   = 10; //maximum score reachable (success achieved), then the game score resets
	for(i=0;i<=maxScore;i++) listOfChoices[i]=-1;
	
	listOfAnimals = [[NSArray alloc] initWithObjects:@"Animal_Sounds_bats",@"Animal_Sounds_bear",
						   @"Animal_Sounds_chimpanzee",@"Animal_Sounds_elephant",@"Animal_Sounds_giraffe",
						   @"Animal_Sounds_lion",@"Animal_Sounds_peacock",@"Animal_Sounds_penguin",
						   @"Animal_Sounds_seaotters",@"Animal_Sounds_snakes",@"Animal_Sounds_tiger",
                           @"Animal_Sounds_gnu",@"Animal_Sounds_gorilla",@"Animal_Sounds_duckling",
                           @"Animal_Sounds_kid",@"Animal_Sounds_lamb",@"Animal_Sounds_piglet",nil];
	
    animalSound[0]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"bats" ofType: @"mp3"]]        retain];
	animalSound[1]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"bear" ofType: @"mp3"]]        retain];
	animalSound[2]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"chimpanzee" ofType: @"mp3"]]  retain];
	animalSound[3]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"elephant" ofType: @"aiff"]]   retain];
	animalSound[4]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"giraffe" ofType: @"mp3"]]     retain];
	animalSound[5]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"roar" ofType: @"aiff"]]       retain];
	animalSound[6]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"peacock" ofType: @"mp3"]]     retain];
	animalSound[7]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"penguin" ofType: @"mp3"]]     retain];
	animalSound[8]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"otter" ofType: @"mp3"]]       retain];
	animalSound[9]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"rattlesnake" ofType: @"mp3"]] retain];
	animalSound[10] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"tiger" ofType: @"mp3"]]       retain];
	animalSound[11] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"wildebeest" ofType: @"mp3"]]  retain];
	animalSound[12] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"gorilla" ofType: @"mp3"]]     retain];
	animalSound[13] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Duckling" ofType: @"mp3"]]    retain];
	animalSound[14] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Kid" ofType: @"mp3"]]         retain];
	animalSound[15] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Lamb" ofType: @"mp3"]]        retain];
	animalSound[16] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Piglet" ofType: @"mp3"]]      retain];
    
    //score images
    imageScore = [[NSArray alloc] initWithObjects:@"Levels_Button_0",@"Levels_Button_1",@"Levels_Button_2",@"Levels_Button_3",@"Levels_Button_4",@"Levels_Button_5",@"Levels_Button_6",@"Levels_Button_7",@"Levels_Button_8",@"Levels_Button_9",@"Levels_Button_10",@"Levels_Button_11",@"Levels_Button_12",@"Levels_Button_13",@"Levels_Button_14",@"Levels_Button_15",@"Levels_Button_16",@"Levels_Button_17",@"Levels_Button_18",@"Levels_Button_19",@"Levels_Button_20",nil];
	
    imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.score] ofType:@"png"]];
	[self.scoreView setImage:imageScoreI];
    
	//create sound of successful piece		
    self.successSound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"applause2_x" ofType: @"mp3"]];
	
    image[0]=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfAnimals objectAtIndex:0] ofType:@"png"]];
    image[1]=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfAnimals objectAtIndex:1] ofType:@"png"]];
    image[2]=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfAnimals objectAtIndex:2] ofType:@"png"]];
    
    animalView1 = [[UIImageView alloc] initWithImage:image[0]];
	animalView2 = [[UIImageView alloc] initWithImage:image[1]];
	animalView3 = [[UIImageView alloc] initWithImage:image[2]];
    
    self.confirmationCalled = NO;
    buttonToAnimate=nil;
    
    //set the appropriate title image (in English or French)
    if([preferences boolForKey:@"language"]) //if it's in English
	{    
    titleImageFrEn    =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_AnimalSoundsMatch_Title" ofType:@"png"]];
    startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Start_Over" ofType:@"png"]];
    }else{
    titleImageFrEn    =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_LesSonsDesAnimaux_Title" ofType:@"png"]];
    startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_Recommence" ofType:@"png"]];
    }

    [self.titleImage setImage:titleImageFrEn];
    [self.startOver  setImage:startOverImageFrEn forState:UIControlStateNormal];
   
    nullImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NULL" ofType:@"png"]];
    
    BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BKGD_Animal_Sounds_Match" ofType:@"jpg"]];
    [self.imageBkng setImage:BKGDImage];
    
    isInitialized = 1001;

    self.backButton.exclusiveTouch =YES;
	self.playSound.exclusiveTouch  =YES;
	self.startOver.exclusiveTouch  =YES;
    self.animalView1.exclusiveTouch=YES;
    self.animalView2.exclusiveTouch=YES;
    self.animalView3.exclusiveTouch=YES;
}

- (void) changeTitleLanguage: (BOOL) inEnglish{
	
    if(isInitialized == 1001){
        
        [titleImageFrEn     release];
        [startOverImageFrEn release];
        [BKGDImage          release];

        if(inEnglish) //if it's in English
        {
            titleImageFrEn = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_AnimalSoundsMatch_Title" ofType:@"png"]];
            startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Start_Over" ofType:@"png"]];
        }
        else
        {
            titleImageFrEn = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_LesSonsDesAnimaux_Title" ofType:@"png"]];
        startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_Recommence" ofType:@"png"]];
        }
        [self.titleImage setImage:titleImageFrEn];
        [self.startOver setImage:startOverImageFrEn forState:UIControlStateNormal];
        BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BKGD_Animal_Sounds_Match" ofType:@"jpg"]];
        [self.imageBkng setImage:BKGDImage];

    }
    
}

- (void) createViews{
	
	int i;
	
    if(self.animalView1.superview)  [self.animalView1 removeFromSuperview];
    if(self.animalView2.superview)	[self.animalView2 removeFromSuperview];
    if(self.animalView3.superview)  [self.animalView3 removeFromSuperview];
    
	//choose an animal randomly	
	animalChoice   = arc4random() % nAnimals;
	for(i=0;i<=maxScore;i++) if(animalChoice == listOfChoices[i])
	{
		animalChoice = arc4random() % nAnimals; //to make sure the same animal is not selected twice
		i=-1;
	}
	listOfChoices[self.score]=animalChoice;
	//select the position of this animal amongst the 3 images
	animalSelected = arc4random() % 3;
		
	CGPoint center;
    
    if(animalSelected == 0) choice[0]=animalChoice;
	else
	{
		choice[0] = arc4random() % nAnimals;
		while(choice[0] == animalChoice) choice[0] = arc4random() % nAnimals;
	}	
		
	center = CGPointMake(185,400);
    [image[0] release];
    image[0]=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfAnimals objectAtIndex:choice[0]] ofType:@"png"]];
    [self.animalView1 setImage:image[0]];
	self.animalView1.hidden = YES;
	self.animalView1.userInteractionEnabled = YES;
	self.animalView1.frame = CGRectMake(0,0,image[0].size.width*0.8,image[0].size.height*0.8);	
	self.animalView1.center= center;

	if(animalSelected == 1) choice[1]=animalChoice;
	else
	{
		choice[1] = arc4random() % nAnimals ;
		while(choice[1] == choice[0] || choice[1] == animalChoice) choice[1] = arc4random() % nAnimals;
	}

	center = CGPointMake(510,400);
    [image[1] release];
    image[1]=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfAnimals objectAtIndex:choice[1]] ofType:@"png"]];
    [self.animalView2 setImage:image[1]];
	self.animalView2.hidden = YES;
	self.animalView2.userInteractionEnabled = YES;
	self.animalView2.frame = CGRectMake(0,0,image[1].size.width*0.8,image[1].size.height*0.8);	
	self.animalView2.center = center;

	if(animalSelected == 2) choice[2]=animalChoice;
	else
	{
		choice[2] = arc4random() % nAnimals ;
		while(choice[2] == choice[0] || choice[2] == choice[1]) choice[2] = arc4random() % nAnimals ;
	}
	
	center = CGPointMake(835,400);
    [image[2] release];
    image[2]=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfAnimals objectAtIndex:choice[2]] ofType:@"png"]];
    [self.animalView3 setImage:image[2]];
	self.animalView3.hidden = YES;
	self.animalView3.userInteractionEnabled = YES;
	self.animalView3.frame = CGRectMake(0,0,image[2].size.width*0.8,image[2].size.height*0.8);	
	self.animalView3.center = center;
	
	[self.view addSubview:self.animalView1];
	[self.view addSubview:self.animalView2];
	[self.view addSubview:self.animalView3];
	self.animalView1.hidden = NO;
	self.animalView2.hidden = NO;
	self.animalView3.hidden = NO;
	self.animalView1.alpha = 1.0;
	self.animalView2.alpha = 1.0;
	self.animalView3.alpha = 1.0;
				
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (IBAction) backButtonClicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.backButton;
    [player stop];
    [player release];
    player=nil;
    [self animateView2];
}
-(void) endAnimationBackButton{
    self.caller.confirmation.start=NO; //we do not want to start over, we want to exit the game
    self.confirmationCalled=YES;
    self.caller.confirmation.caller = self;
    [self.caller.confirmation createConfirmation];
}

-(void) killViews{
    [player stop];
    [player release];
    player=nil;
	if(self.animalView1.superview)  [self.animalView1 removeFromSuperview];
	if(self.animalView2.superview)  [self.animalView2 removeFromSuperview];
	if(self.animalView3.superview)  [self.animalView3 removeFromSuperview];
}

-(void) enableAllButtons{
    self.backButton.userInteractionEnabled  = YES;
    self.startOver.userInteractionEnabled   = YES;
    self.playSound.userInteractionEnabled   = YES;
    self.animalView1.userInteractionEnabled = YES;
    self.animalView2.userInteractionEnabled = YES;
    self.animalView3.userInteractionEnabled = YES;
}

-(void) deactivateAllButtons{
    self.backButton.userInteractionEnabled  = NO;
    self.startOver.userInteractionEnabled   = NO;
    self.playSound.userInteractionEnabled   = NO;
    self.animalView1.userInteractionEnabled = NO;
    self.animalView2.userInteractionEnabled = NO;
    self.animalView3.userInteractionEnabled = NO;
}


-(void) confirmationCalled:(BOOL)isCalled withExit:(BOOL)exiting{
    
    self.confirmationCalled = isCalled;
    if(exiting){
        [BKGDImage release];
        BKGDImage=nil;
        [self.imageBkng setImage:nullImage];
        int i;
        for(i=0;i<=maxScore;i++) listOfChoices[i]=-1;
        self.score = 0;
        [self killViews];
        [self createViews];
        [imageScoreI release];
        imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.score] ofType:@"png"]];
        [self.scoreView setImage:imageScoreI];
    }
}
- (void) pauseTimers{}
- (void) pauseLayers{}
- (void) resumeTimers{}
- (void) resumeLayers{}

- (IBAction) playSoundClicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.playSound;
    [self animateView2];
}
-(void) endAnimationPlaySound{
    [player stop];
    [player release];
    player=nil;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:animalSound[choice[animalSelected]] error:&error];
    player.delegate=(id)self;
    player.volume = 1.0f;
    if([player prepareToPlay])[player play];
    [self enableAllButtons];
}

- (void) doneWithMessage{

	if(self.score < maxScore)
	{
		[self killViews];
		[self createViews];
        [self enableAllButtons];
		[self playSoundClicked];	
	}
	if(self.score == maxScore)[self startOverCalled];
	
}

- (IBAction) startOverClicked{
    [self deactivateAllButtons];
    self.confirmationCalled=YES;
    self.caller.confirmation.start=YES; //we want to start over, we do not want to exit the game
    self.caller.confirmation.caller = self;
    [self.caller.confirmation createConfirmation];
}
- (void) startOverCalled{
    [self deactivateAllButtons];
    buttonToAnimate=self.startOver;
    [self animateView2];
}
-(void) endAnimationStartOver{
	int i;
	for(i=0;i<=maxScore;i++) listOfChoices[i]=-1;
	self.score = 0;
	[self killViews];
	[self createViews];
    [imageScoreI release];
    imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.score] ofType:@"png"]];
	[self.scoreView setImage:imageScoreI];
	[self playSoundClicked];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch=[touches anyObject];
    if ([touch view] == self.animalView1 || [touch view] == self.animalView2 || [touch view] == self.animalView3 || [touch view] == self.startOver || [touch view] == self.backButton || [touch view] == self.playSound) [self deactivateAllButtons];
    
    if(self.confirmationCalled)[self.caller.confirmation touchesBegan:touches withEvent:event];
    else{
    
    int i=0;
    BOOL buttonTouched=NO;
        
	int success = 0;
	
	if ([touch view] == self.animalView1) viewToAnimate=self.animalView1;
	if ([touch view] == self.animalView2) viewToAnimate=self.animalView2;
	if ([touch view] == self.animalView3) viewToAnimate=self.animalView3;
	if ([touch view] == self.animalView1 || [touch view] == self.animalView2 || [touch view] == self.animalView3) buttonTouched=YES;
	
	//we animate the button that has been pressed
	if(buttonTouched) [self animateView];
	
	//determine whether the choice of animal is correct or wrong
	if(buttonTouched)
	{
		if ([touch view] == animalView1 && animalSelected == 0) success=1;
		if ([touch view] == animalView2 && animalSelected == 1) success=1;
		if ([touch view] == animalView3 && animalSelected == 2) success=1;
	
		if(success == 0)  //failure
		{
			self.score = 0;	
			for(i=0;i<=maxScore;i++) listOfChoices[i]=-1;
            [imageScoreI release];
            imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.score] ofType:@"png"]];
            [self.scoreView setImage:imageScoreI];
            self.caller.messages2.caller = self;
			[self.caller.messages2 createMessages];//call failure messages
		}
		else //success
		{
			self.score += 1;	
			if(self.score == maxScore)
            {
                [player stop];
                [player release];
                player=nil;
                player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.successSound error:&error];
                player.delegate=(id)self;
                player.volume = 1.0f;
                if([player prepareToPlay])[player play];
            }
            [imageScoreI release];
            imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.score] ofType:@"png"]];
            [self.scoreView setImage:imageScoreI];
            self.caller.messages.caller = self;
			[self.caller.messages createMessages];//call success messages
		}
    }
    }
    
}

- (void) animateView{
    [UIView beginAnimations:@"AnimalTouched" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    width0 = viewToAnimate.frame.size.width;
    height0= viewToAnimate.frame.size.height;
    x0     = viewToAnimate.frame.origin.x;
    y0     = viewToAnimate.frame.origin.y;
    viewToAnimate.frame = CGRectMake(x0-width0*0.1,y0-height0*0.1,width0*1.2,height0*1.2);
    [UIView setAnimationDidStopSelector:@selector(animateViewDone)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
}

- (void) animateViewDone{
	
	[UIView beginAnimations:@"AnimalTouchedDone" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	viewToAnimate.frame = CGRectMake(x0,y0,width0,height0);
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
	
}

- (void) stopSoundClicked{
    [player stop];
    [player release];
    player=nil;
}


- (void) animateView2
{
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"buttonTouched" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    buttonToAnimate.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    [UIView setAnimationDidStopSelector:@selector(animateView2Done)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

- (void) animateView2Done
{
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
	[UIView beginAnimations:@"buttonTouchedDone" context:nil];
	[UIView setAnimationDuration:0.15];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
    buttonToAnimate.transform = CGAffineTransformScale(affineTransform,1.0,1.0);
    if([buttonToAnimate isEqual:self.backButton]) [UIView setAnimationDidStopSelector:@selector(endAnimationBackButton)];
    if([buttonToAnimate isEqual:self.playSound])  [UIView setAnimationDidStopSelector:@selector(endAnimationPlaySound)];
    if([buttonToAnimate isEqual:self.startOver])  [UIView setAnimationDidStopSelector:@selector(endAnimationStartOver)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	
	int i;
	
	self.backButton  = nil;
	self.titleImage  = nil;
	self.playSound   = nil;
	self.startOver   = nil;
	self.scoreView   = nil;
    self.animalView1 = nil;
	self.animalView2 = nil;
	self.animalView3 = nil;
	self.listOfAnimals=nil;
    for(i=0;i<nAnimals;i++){
    [animalSound[i] release];
    animalSound[i]   = nil;}
    for(i=0;i<3;i++){
    [image[i]       release];
    image[i]         = nil;}
    [imageScore     release];
    imageScore       = nil;
    [imageScoreI    release];
    imageScoreI      = nil;
    self.successSound= nil;
    [titleImageFrEn release];
    [startOverImageFrEn release];
    titleImageFrEn   = nil;
    startOverImageFrEn=nil;
    isInitialized = 0;
    self.imageBkng=nil;
    [nullImage release];
    nullImage=nil;
    [BKGDImage release];
    BKGDImage=nil;
    //[player release];
    //player=nil;
    [super viewDidUnload];
}


- (void)dealloc {
	
	int i;
	
	[caller        release];
	[caller2       release];
	[animalView1   release];
	[animalView2   release];
	[animalView3   release];
	[listOfAnimals release];
	[scoreView     release];
	[backButton    release];
	[titleImage    release];
	[playSound     release];
	[startOver     release];
	for(i=0;i<nAnimals;i++) [animalSound[i] release];
    for(i=0;i<3;i++)        [image[i]       release];
    [imageScore    release];
    [imageScoreI   release];
    [successSound  release];
    [player        release];
    [titleImageFrEn release];
    [startOverImageFrEn release];
    [imageBkng     release];
    [nullImage     release];
    [BKGDImage     release];
    [super dealloc];
}


@end
