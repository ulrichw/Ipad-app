//
//  Game4Menu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 3/11/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "GamesMenu.h"
#import "Game4Menu.h"
#import "Messages.h"
#import "Messages2.h"
#import "Confirmation.h"

@implementation Game4Menu

@synthesize backButton,startOver,successSound,confirmationCalled;
@synthesize score,caller,caller2,listOfAnimals,listOfImagesFr,listOfImagesEn,scoreView;
@synthesize button1,button2,button3,button4,button5,titleBanner,centralPicture,backgroundPicture,audioButton;

- (void)viewDidLoad {
    [super viewDidLoad];
	int i;
	
	self.score = 0;
	maxScore   = 10; //maximum score reachable (success achieved), then the game score resets
	for(i=0;i<=maxScore;i++) listOfChoices[i]=-1;

	listOfAnimals  = [[NSArray alloc] initWithObjects:@"FEWM_card_bats",@"FEWM_card_bear",
						   @"FEWM_card_chimpanzee",@"FEWM_card_elephant",@"FEWM_card_giraffe",
						   @"FEWM_card_lion",@"FEWM_card_peacock",@"FEWM_card_penguin",
						   @"FEWM_card_seaotters",@"FEWM_card_snakes",@"FEWM_card_tiger",
                           @"FEWM_card_gnu",@"FEWM_card_gorilla",@"FEWM_card_duckling",@"FEWM_card_kid",
                           @"FEWM_card_lamb",@"FEWM_card_piglet",nil];
	
	listOfImagesEn = [[NSArray alloc] initWithObjects:@"FEWM_button_bat",@"FEWM_button_bear",
						  @"FEWM_button_monkey",@"FEWM_button_elephant",@"FEWM_button_giraffe",
						  @"FEWM_button_lion",@"FEWM_button_peacock",@"FEWM_button_penguin",
						  @"FEWM_button_seaotter",@"FEWM_button_snake",@"FEWM_button_tiger",
                          @"FEWM_button_wildebeest",@"FEWM_button_gorilla",@"FEWM_button_duckling",
                          @"FEWM_button_kid",@"FEWM_button_lamb",@"FEWM_button_piglet",nil];
	
	listOfImagesFr = [[NSArray alloc] initWithObjects:@"FEWM_button_unchauvesouris",@"FEWM_button_unours",
							@"FEWM_button_unsinge",@"FEWM_button_unelephant",@"FEWM_button_unegirafe",
							@"FEWM_button_unlion",@"FEWM_button_unpaon",@"FEWM_button_unmanchot",
							@"FEWM_button_uneloutredemer",@"FEWM_button_unserpent",@"FEWM_button_untigre",
							@"FEWM_button_ungnu",@"FEWM_button_unegorille",@"FEWM_button_unecaneton",
                            @"FEWM_button_unchevreau",@"FEWM_button_unagneau",@"FEWM_button_uncochonnet",nil];
	
	preferences = [NSUserDefaults standardUserDefaults];

	[self selectAnimal];
	
	[self.caller setImageForAudioButtons];

	//score images
    imageScore = [[NSArray alloc] initWithObjects:@"Levels_Button_0",@"Levels_Button_1",@"Levels_Button_2",@"Levels_Button_3",@"Levels_Button_4",@"Levels_Button_5",@"Levels_Button_6",@"Levels_Button_7",@"Levels_Button_8",@"Levels_Button_9",@"Levels_Button_10",@"Levels_Button_11",@"Levels_Button_12",@"Levels_Button_13",@"Levels_Button_14",@"Levels_Button_15",@"Levels_Button_16",@"Levels_Button_17",@"Levels_Button_18",@"Levels_Button_19",@"Levels_Button_20",nil];
    imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.score] ofType:@"png"]];
	[self.scoreView setImage:imageScoreI];
	
	//create sound of successful piece		
    self.successSound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"applause2_x" ofType: @"mp3"]];

    self.confirmationCalled = NO;
    buttonToAnimate=nil;
    self.button5.userInteractionEnabled=NO;
    
    //set the appropriate title image (in English or French)
    if([preferences boolForKey:@"language"]) //if it's in English
	{
        titleImageFrEn    =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_FEWM_title" ofType:@"png"]];
        startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Start_Over" ofType:@"png"]];
    }else{
        titleImageFrEn    =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_FEWM_title" ofType:@"png"]];
        startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_Recommence" ofType:@"png"]];
    }

    [self.titleBanner setImage:titleImageFrEn];
    [self.startOver   setImage:startOverImageFrEn forState:UIControlStateNormal];
    
    nullImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NULL" ofType:@"png"]];
    
    BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BKGD_FEWM" ofType:@"jpg"]];
    [self.backgroundPicture setImage:BKGDImage];
    
    isInitialized = 1001;

    self.backButton.exclusiveTouch =YES;
	self.startOver.exclusiveTouch  =YES;
	self.button1.exclusiveTouch    =YES;
	self.button2.exclusiveTouch    =YES;
	self.button3.exclusiveTouch    =YES;
	self.button4.exclusiveTouch    =YES;
	self.button5.exclusiveTouch    =YES;
	self.audioButton.exclusiveTouch=YES;
    
}

- (void) changeTitleLanguage: (BOOL) inEnglish{
	
    if(isInitialized == 1001){
        
        [titleImageFrEn     release];
        [startOverImageFrEn release];
        [BKGDImage      release];

        if(inEnglish) //if it's in English
        {
            titleImageFrEn =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_FEWM_title" ofType:@"png"]];
            startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Start_Over" ofType:@"png"]];
        }
        else {
            titleImageFrEn =[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_FEWM_title" ofType:@"png"]];
            startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_Recommence" ofType:@"png"]];
        }
 
        [self.titleBanner setImage:titleImageFrEn];
        [self.startOver setImage:startOverImageFrEn forState:UIControlStateNormal];
        BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BKGD_FEWM" ofType:@"jpg"]];
        [self.backgroundPicture setImage:BKGDImage];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void) selectAnimal{

	int i;
	
	choice[0] = arc4random() % nAnimals; //the animal to match
	for(i=0;i<=maxScore;i++) if(choice[0] == listOfChoices[i])
	{
		choice[0] = arc4random() % nAnimals; //to make sure the same animal is not selected twice
		i=-1;
	}
	listOfChoices[self.score]=choice[0];
	
	choice[1] = arc4random() % nAnimals;
	while(choice[1] == choice[0]) choice[1] = arc4random() % nAnimals;
	choice[2] = arc4random() % nAnimals;
	while(choice[2] == choice[0] || choice[2] == choice[1]) choice[2] = arc4random() % nAnimals;
	choice[3] = arc4random() % nAnimals;
	while(choice[3] == choice[0] || choice[3] == choice[2] || choice[3] == choice[1]) choice[3] = arc4random() % nAnimals;
	choice[4] = arc4random() % nAnimals;
	while(choice[4] == choice[0] || choice[4] == choice[3] || choice[4] == choice[2] || choice[4] == choice[1]) choice[4] = arc4random() % nAnimals;
	
	correctButton = arc4random() % 4;
	correctButton++;
	choice[correctButton]=choice[0];
	
    [imageAnimal release];
    imageAnimal=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfAnimals objectAtIndex:choice[0]] ofType:@"png"]];
    [self.centralPicture setImage:imageAnimal];

	if([preferences boolForKey:@"language"]) //if it's in English
	{
        [imageTextFr1 release];
        [imageTextEn1 release];
        [imageTextEn2 release];
        [imageTextEn3 release];
        [imageTextEn4 release];
        
        imageTextFr1=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesFr objectAtIndex:choice[0]] ofType:@"png"]];
        imageTextEn1=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesEn objectAtIndex:choice[1]] ofType:@"png"]];
        imageTextEn2=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesEn objectAtIndex:choice[2]] ofType:@"png"]];
        imageTextEn3=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesEn objectAtIndex:choice[3]] ofType:@"png"]];
        imageTextEn4=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesEn objectAtIndex:choice[4]] ofType:@"png"]];

		[self.button5 setImage:imageTextFr1 forState:UIControlStateNormal ];
		[self.button1 setImage:imageTextEn1 forState:UIControlStateNormal ];
		[self.button2 setImage:imageTextEn2 forState:UIControlStateNormal ];
		[self.button3 setImage:imageTextEn3 forState:UIControlStateNormal ];
		[self.button4 setImage:imageTextEn4 forState:UIControlStateNormal ];
	}
	else
	{
        [imageTextEn1 release];
        [imageTextFr1 release];
        [imageTextFr2 release];
        [imageTextFr3 release];
        [imageTextFr4 release];

        imageTextEn1=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesEn objectAtIndex:choice[0]] ofType:@"png"]];
        imageTextFr1=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesFr objectAtIndex:choice[1]] ofType:@"png"]];
        imageTextFr2=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesFr objectAtIndex:choice[2]] ofType:@"png"]];
        imageTextFr3=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesFr objectAtIndex:choice[3]] ofType:@"png"]];
        imageTextFr4=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfImagesFr objectAtIndex:choice[4]] ofType:@"png"]];

		[self.button5 setImage:imageTextEn1 forState:UIControlStateNormal ];
		[self.button1 setImage:imageTextFr1 forState:UIControlStateNormal ];
		[self.button2 setImage:imageTextFr2 forState:UIControlStateNormal ];
		[self.button3 setImage:imageTextFr3 forState:UIControlStateNormal ];
		[self.button4 setImage:imageTextFr4 forState:UIControlStateNormal ];
	}
	
    [self enableAllButtons];

}

- (IBAction) backButtonClicked{
    [self deactivateAllButtons];
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
    [self.caller.confirmation createConfirmation];
}

- (IBAction) startOverClicked{
    [self deactivateAllButtons];
    self.confirmationCalled=YES;
    self.caller.confirmation.start=YES; //we do not want to start over, we want to exit the game
    self.caller.confirmation.caller = self;
    [self.caller.confirmation createConfirmation];
}
- (void) startOverCalled{
    [self deactivateAllButtons];
    buttonToAnimate=self.startOver;
    [self animateView];
    }
-(void) endAnimationButtonStartOver{
	int i;
	for(i=0;i<=maxScore;i++) listOfChoices[i]=-1;
	self.score = 0;
    [imageScoreI release];
    imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.score] ofType:@"png"]];
	[self.scoreView setImage:imageScoreI];
    [self selectAnimal];
}

-(void) enableAllButtons{
    self.button1.userInteractionEnabled   =YES;
    self.button2.userInteractionEnabled   =YES;
    self.button3.userInteractionEnabled   =YES;
    self.button4.userInteractionEnabled   =YES;
    self.startOver.userInteractionEnabled =YES;
    self.backButton.userInteractionEnabled=YES;
}

-(void) deactivateAllButtons{
    self.button1.userInteractionEnabled   =NO;
    self.button2.userInteractionEnabled   =NO;
    self.button3.userInteractionEnabled   =NO;
    self.button4.userInteractionEnabled   =NO;
    self.startOver.userInteractionEnabled =NO;
    self.backButton.userInteractionEnabled=NO;
}


-(void) confirmationCalled:(BOOL)isCalled withExit:(BOOL)exiting{
    self.confirmationCalled = isCalled;
    if(exiting){
        int i;
        for(i=0;i<=maxScore;i++) listOfChoices[i]=-1;
        self.score = 0;
        [imageScoreI release];
        imageScoreI = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageScore objectAtIndex:self.score] ofType:@"png"]];
        [self.scoreView setImage:imageScoreI];
        [BKGDImage release];
        BKGDImage=nil;
        [self.backgroundPicture setImage:nullImage];
    }
}
- (void) pauseTimers{}
- (void) pauseLayers{}
- (void) resumeTimers{}
- (void) resumeLayers{}

- (IBAction) button1Clicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.button1;
    [self animateView];
}
-(void) endAnimationButton1{

	if(correctButton == 1)
	{
		self.caller.messages.caller = self;
		self.score += 1;	
		if(self.score == maxScore && [preferences boolForKey:@"audio"])
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
		[self.caller.messages createMessages];	
	}
	else
	{
		self.score=maxScore;
		self.caller.messages2.caller = self;
		[self.caller.messages2 createMessages];
	}
}
- (IBAction) button2Clicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.button2;
    [self animateView];
}
-(void) endAnimationButton2{

	if(correctButton == 2)
	{
		self.caller.messages.caller = self;
		self.score += 1;
        if(self.score == maxScore && [preferences boolForKey:@"audio"])
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
		[self.caller.messages createMessages];	
	}
	else
	{
		self.score=maxScore;
		self.caller.messages2.caller = self;
		[self.caller.messages2 createMessages];
	}
}
- (IBAction) button3Clicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.button3;
    [self animateView];
}
-(void) endAnimationButton3{

	if(correctButton == 3)
	{
		self.caller.messages.caller = self;
		self.score += 1;	
        if(self.score == maxScore && [preferences boolForKey:@"audio"])
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
		[self.caller.messages createMessages];	
	}
	else
	{
		self.score=maxScore;
		self.caller.messages2.caller = self;
		[self.caller.messages2 createMessages];
	}
}
- (IBAction) button4Clicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.button4;
    [self animateView];
}
-(void) endAnimationButton4{

	if(correctButton == 4)
	{
		self.caller.messages.caller = self;
		self.score += 1;	
        if(self.score == maxScore && [preferences boolForKey:@"audio"])
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
		[self.caller.messages createMessages];	
	}
	else
	{
		self.score=maxScore;
		self.caller.messages2.caller = self;
		[self.caller.messages2 createMessages];
	}
}


- (void) doneWithMessage{
	if(self.score < maxScore) [self selectAnimal];
	if(self.score == maxScore)[self startOverCalled];
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
    if([buttonToAnimate isEqual:self.button1])     [UIView setAnimationDidStopSelector:@selector(endAnimationButton1)];
    if([buttonToAnimate isEqual:self.button2])     [UIView setAnimationDidStopSelector:@selector(endAnimationButton2)];
    if([buttonToAnimate isEqual:self.button3])     [UIView setAnimationDidStopSelector:@selector(endAnimationButton3)];
    if([buttonToAnimate isEqual:self.button4])     [UIView setAnimationDidStopSelector:@selector(endAnimationButton4)];
    if([buttonToAnimate isEqual:self.startOver])   [UIView setAnimationDidStopSelector:@selector(endAnimationButtonStartOver)];
    if([buttonToAnimate isEqual:self.backButton])  [UIView setAnimationDidStopSelector:@selector(endAnimationButtonBack)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];	
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.confirmationCalled)[self.caller.confirmation touchesBegan:touches withEvent:event];
}


- (void)viewDidUnload {
	
	self.backButton         = nil;
	self.startOver          = nil;
	self.button1            = nil;
	self.button2            = nil;
	self.button3            = nil;
	self.button4            = nil;
	self.button5            = nil;
	self.audioButton        = nil;
	self.titleBanner        = nil;
	self.centralPicture     = nil;
	self.backgroundPicture  = nil;
	self.listOfAnimals      = nil;
	self.listOfImagesFr     = nil;
	self.listOfImagesEn     = nil;
	self.scoreView          = nil;
    [imageAnimal  release];
    [imageTextFr1 release];
    [imageTextEn1 release];
    [imageTextFr2 release];
    [imageTextEn2 release];
    [imageTextFr3 release];
    [imageTextEn3 release];
    [imageTextFr4 release];
    [imageTextEn4 release];
    [imageScore   release];
    [imageScoreI  release];
    imageAnimal             = nil;
    imageTextFr1            = nil;
    imageTextEn1            = nil;
    imageTextFr2            = nil;
    imageTextEn2            = nil;
    imageTextFr3            = nil;
    imageTextEn3            = nil;
    imageTextFr4            = nil;
    imageTextEn4            = nil;
    imageScore              = nil;
    imageScoreI             = nil;
    [titleImageFrEn     release];
    [startOverImageFrEn release];
    titleImageFrEn          = nil;
    startOverImageFrEn      = nil;
    self.successSound       = nil;
    [nullImage release];
    nullImage=nil;
    [BKGDImage release];
    BKGDImage=nil;
    //[player release];
    //player=nil;
    isInitialized = 0;
    [super viewDidUnload];
}


- (void)dealloc {
    [backButton        release];
	[startOver         release];
	[caller            release];
	[caller2           release];
	[button1           release];
	[button2           release];
	[button3           release];
	[button4           release];
	[button5           release];
	[audioButton       release];
	[titleBanner       release];
	[centralPicture    release];
	[backgroundPicture release];
	[listOfAnimals     release];
	[listOfImagesFr    release];
	[listOfImagesEn    release];
	[scoreView         release];
    [imageAnimal       release];
    [imageTextFr1      release];
    [imageTextEn1      release];
    [imageTextFr2      release];
    [imageTextEn2      release];
    [imageTextFr3      release];
    [imageTextEn3      release];
    [imageTextFr4      release];
    [imageTextEn4      release];
    [imageScore        release];
    [imageScoreI       release];
	[successSound      release];
    [player            release];
    [titleImageFrEn    release];
    [startOverImageFrEn release];
    [super dealloc];
}


@end
