//
//  MainMenu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "MainMenu.h"
#import "CastMenu.h"
#import "CreditsMenu.h"
#import "CastMenu.h"
#import "CreditsMenu.h"
#import "AnimalMenu.h"
#import "BookPage.h"
#import "ChimpView.h"
#import "PenguinView.h"
#import "BatView.h"
#import "BalloonView.h"
#import "PuzzleMenu.h"
#import "GamesMenu.h"
#import "Game2Menu.h"
#import "Game3Menu.h"
#import "Game4Menu.h"
#import "Messages.h"
#import "Messages2.h"
#import "Confirmation.h"
 
@implementation MainMenu

@synthesize buttonCast, buttonStart, buttonOptions, buttonCredits, buttonAnimals, buttonPuzzle, imageView;
@synthesize bannerTheNew, bannerParis, bannerZoo, chimp, penguin, bat, balloon;
@synthesize buttonAnimation,confirmation;
@synthesize audioControl,imageAudioOn,imageAudioOff;
@synthesize creditsMenu,animalMenu,castMenu,bookPage,puzzleMenu,gamesMenu, game2Menu, game3Menu, game4Menu, messages,messages2;

- (void)viewDidLoad {
	
    [super viewDidLoad];
		
	//set the audio controls
	preferences = [NSUserDefaults standardUserDefaults];
	if([preferences dataForKey:@"audio"]    == nil) [preferences setBool:YES forKey:@"audio"]; //the key does not exist and is created
	if([preferences dataForKey:@"language"] == nil) [preferences setBool:YES forKey:@"language"]; //YES means English, NO means French
    [preferences synchronize];
    
	//initialization of subviews
    if([preferences boolForKey:@"language"])
    {
        imageTitleTheNew=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TheNew" ofType:@"png"]];
        imageTitleParis= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris" ofType:@"png"]];
        imageTitleZoo  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zoo" ofType:@"png"]];
    }
    else
    {
        imageTitleTheNew= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LeNouveau" ofType:@"png"]];
        imageTitleParis = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DeParis" ofType:@"png"]];
        imageTitleZoo   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ZooFr" ofType:@"png"]];
	}
    
	imageChimp   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Chimp"      ofType:@"png"]];
	imagePenguin = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Penguin"    ofType:@"png"]];
	imageBat     = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Bat_closed" ofType:@"png"]];
	imageBalloon = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Balloons"   ofType:@"png"]];
	self.imageAudioOn = [UIImage imageNamed:@"Title_Page_Button_Audio_On.png" ];
	self.imageAudioOff= [UIImage imageNamed:@"Title_Page_Button_Audio_Off.png"];
    
	imageFrancais = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_en_francais" ofType:@"png"]];
	imageEnglish  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_in_english" ofType:@"png"]];
    
    if([preferences boolForKey:@"language"])
    {
	imageButtonCast   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_The_Class" ofType:@"png"]];
	imageButtonStart  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Read" ofType:@"png"]];
	imageButtonCredits= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Glossary" ofType:@"png"]];
	imageButtonAnimals= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Animals" ofType:@"png"]];
	imageButtonPuzzle = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Games" ofType:@"png"]];
    }
    else
    {
	imageButtonCast   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_LaClasse" ofType:@"png"]];
	imageButtonStart  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Lire" ofType:@"png"]];
	imageButtonCredits= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Glossaire" ofType:@"png"]];
	imageButtonAnimals= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_LesAnimaux" ofType:@"png"]];
	imageButtonPuzzle = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Jeux" ofType:@"png"]];
    }
    
    bookPage         = [[BookPage    alloc] initWithNibName:@"BookPage"    bundle:nil];
	creditsMenu      = [[CreditsMenu alloc] initWithNibName:@"CreditsMenu" bundle:nil];
	castMenu         = [[CastMenu    alloc] initWithNibName:@"CastMenu"    bundle:nil];
	puzzleMenu       = [[PuzzleMenu  alloc] initWithNibName:@"PuzzleMenu"  bundle:nil];
	gamesMenu        = [[GamesMenu   alloc] initWithNibName:@"GamesMenu"   bundle:nil];
	game2Menu        = [[Game2Menu   alloc] initWithNibName:@"Game2Menu"   bundle:nil];
	game3Menu        = [[Game3Menu   alloc] initWithNibName:@"Game3Menu"   bundle:nil];
	game4Menu        = [[Game4Menu   alloc] initWithNibName:@"Game4Menu"   bundle:nil];
    animalMenu       = [[AnimalMenu  alloc] initWithNibName:@"AnimalMenu"  bundle:nil];
    
	messages         = [[Messages    alloc] init];
	messages2        = [[Messages2   alloc] init];
	[self.messages     viewDidLoad];
	[self.messages2    viewDidLoad];
	confirmation     = [[Confirmation alloc] init];
    [self.confirmation viewDidLoad];
    
	bannerTheNew     = [[UIImageView alloc] initWithImage:imageTitleTheNew];
	bannerParis      = [[UIImageView alloc] initWithImage:imageTitleParis ];
	bannerZoo        = [[UIImageView alloc] initWithImage:imageTitleZoo   ];

	chimp            = [[ChimpView   alloc] initWithImage:imageChimp      ];
	penguin          = [[PenguinView alloc] initWithImage:imagePenguin    ];
	bat              = [[BatView     alloc] initWithImage:imageBat        ];
	balloon          = [[BalloonView alloc] initWithImage:imageBalloon    ];
	
	self.castMenu.caller       = self;
	self.creditsMenu.caller    = self;
	self.puzzleMenu.caller     = self;
	self.gamesMenu.caller      = self;
	self.game2Menu.caller      = self;
	self.game3Menu.caller      = self;
	self.game4Menu.caller      = self;
    self.bookPage.caller       = self;
    self.animalMenu.caller     = self;

	widthRef   =768;//[[UIScreen mainScreen] bounds].size.width;
	heightRef  =1024;//[[UIScreen mainScreen] bounds].size.height;

	self.chimp.autoresizesSubviews = NO;
	self.chimp.layer.anchorPoint = CGPointMake(0.43,0.025);
	frameChimp  = CGRectMake(0.366*heightRef,0.53*widthRef,imageChimp.size.width,imageChimp.size.height);
	frameChimpFr= CGRectMake(0.75*heightRef,0.075*widthRef,imageChimp.size.width,imageChimp.size.height);
	
	self.chimp.userInteractionEnabled   = YES;
	self.penguin.userInteractionEnabled = YES;
	self.bat.userInteractionEnabled     = YES;
	self.balloon.userInteractionEnabled = YES;
	
	//create the animation for the buttons
	self.buttonAnimation          = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	self.buttonAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0] ,[NSNumber numberWithFloat:0.7] ,[NSNumber numberWithFloat:1.0],nil];
	self.buttonAnimation.values   = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.01],[NSNumber numberWithFloat:1.25],[NSNumber numberWithFloat:1.0],nil];
	
    //select the images depending on the language selected    
    if(![preferences boolForKey:@"language"]) //preferences already exist and are set to French
    {
        [self.buttonOptions setImage:imageEnglish   forState:UIControlStateNormal];
    }
    else{
        [self.buttonOptions setImage:imageFrancais  forState:UIControlStateNormal];   
    }
    [self.buttonStart   setImage:imageButtonStart   forState:UIControlStateNormal];
    [self.buttonCast    setImage:imageButtonCast    forState:UIControlStateNormal];
    [self.buttonCredits setImage:imageButtonCredits forState:UIControlStateNormal];
    [self.buttonAnimals setImage:imageButtonAnimals forState:UIControlStateNormal];
    [self.buttonPuzzle  setImage:imageButtonPuzzle  forState:UIControlStateNormal];
    
    // Audio for the audio button and welcome sound
    soundFileURLRef=[[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"drum" ofType: @"aiff"]] retain];
    soundTitleURL  =[[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"TitlePageAudioEnglish" ofType: @"mp3"]] retain];
    soundTitleURLFr=[[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"LeNouveauZoo" ofType: @"mp3"]] retain];
 	
	//set the animation for the "The New Paris Zoo" banner
	[self bannerAnimation];
	//set the animation for the buttons
	[self buttonsWillAppear:YES];

	[self setImageForAudioButtons];
    
    self.buttonAnimals.exclusiveTouch=YES;
    self.buttonCast.exclusiveTouch   =YES;
    self.buttonCredits.exclusiveTouch=YES;
    self.buttonPuzzle.exclusiveTouch =YES;
    self.buttonStart.exclusiveTouch  =YES;
    self.buttonOptions.exclusiveTouch=YES;
    self.audioControl.exclusiveTouch =YES;
}

- (void) setImageForAudioButtons{

	if([preferences boolForKey:@"audio"]){
		[self.audioControl           setImage:self.imageAudioOn  forState:UIControlStateNormal];
		[self.gamesMenu.audioButton  setImage:self.imageAudioOn  forState:UIControlStateNormal];
		[self.puzzleMenu.audioButton setImage:self.imageAudioOn  forState:UIControlStateNormal];
		[self.game3Menu.audioButton  setImage:self.imageAudioOn  forState:UIControlStateNormal];
		[self.game4Menu.audioButton  setImage:self.imageAudioOn  forState:UIControlStateNormal];		 
	}else{
		[self.audioControl           setImage:self.imageAudioOff forState:UIControlStateNormal];
		[self.gamesMenu.audioButton  setImage:self.imageAudioOff forState:UIControlStateNormal];
		[self.puzzleMenu.audioButton setImage:self.imageAudioOff forState:UIControlStateNormal];
		[self.game3Menu.audioButton  setImage:self.imageAudioOff forState:UIControlStateNormal];
		[self.game4Menu.audioButton  setImage:self.imageAudioOff forState:UIControlStateNormal];		 
	}

}

-(void) playWelcomeSound{
    [player stop];
    [player release];
    player=nil;
    if([preferences boolForKey:@"language"]) player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundTitleURL error:&error];
    else player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundTitleURLFr error:&error];
    player.delegate=(id)self;
    player.volume = 1.0f;
    if([player prepareToPlay])[player play];
}

//deprecated in iOS 6
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskLandscapeLeft;
}

- (void) bannerAnimation {
		
	self.penguin.frame = CGRectMake(1.2*heightRef,0.5*widthRef,imagePenguin.size.width,imagePenguin.size.height);
	self.penguin.alpha = 1.0;
    self.chimp.alpha   = 0.0;
	self.bat.alpha     = 0.0;
	self.balloon.alpha = 0.0;

	if([preferences boolForKey:@"language"]) self.bat.frame = CGRectMake(0.625*heightRef,0.765*widthRef,imageBat.size.width,imageBat.size.height/3.);
	else self.bat.frame = CGRectMake(0.585*heightRef,0.65*widthRef,imageBat.size.width,imageBat.size.height/3.);
	self.balloon.frame  = CGRectMake(0.242*heightRef, -0.3*widthRef, imageBalloon.size.width, imageBalloon.size.height);
	
	self.chimp.transform=CGAffineTransformIdentity; //because you are not allwed to change frame after setting a transform, so without resetting the transform the monkey is stretched!
	if([preferences boolForKey:@"language"]) self.chimp.frame=frameChimp;
	else self.chimp.frame=frameChimpFr;
	
	[self.view addSubview:self.chimp];   //because I want the chimp to be behind the word Paris
	[self.view addSubview:self.penguin];
	[self.view insertSubview:self.chimp belowSubview:self.buttonOptions]; //otherwise the chimp is over it!
        
	//--------------------------

    [imageTitleTheNew release];
    [imageTitleParis  release];
    [imageTitleZoo    release];
     
    if([preferences boolForKey:@"language"])
    {
        imageTitleTheNew=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TheNew" ofType:@"png"]];
        imageTitleParis= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris" ofType:@"png"]];
        imageTitleZoo  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zoo" ofType:@"png"]];

        [self.bannerTheNew setImage:imageTitleTheNew];
        self.bannerTheNew.frame   = CGRectMake(0.0125*heightRef,-0.30*widthRef,imageTitleTheNew.size.width,imageTitleTheNew.size.height);
        self.bannerTheNew.alpha   = 1.0;
        [self.view addSubview:self.bannerTheNew];
        [UIView animateWithDuration:1.05 delay:0.25 options:UIViewAnimationCurveEaseInOut animations:^{[UIView setAnimationDelegate:self]; self.bannerTheNew.frame = CGRectMake(0.0125*heightRef,0.035*widthRef,imageTitleTheNew.size.width,imageTitleTheNew.size.height);} completion:^(BOOL finished){}];
        
        [self.bannerParis setImage:imageTitleParis];
        self.bannerParis.frame = CGRectMake(-0.65*heightRef,0.3*widthRef, imageTitleParis.size.width,imageTitleParis.size.height);
        self.bannerParis.alpha   = 1.0;
        [self.view addSubview:self.bannerParis];
        [UIView animateWithDuration:1.05 delay:0.55 options:UIViewAnimationCurveEaseInOut animations:^{[UIView setAnimationDelegate:self]; self.bannerParis.frame = CGRectMake(0.23*heightRef,0.3*widthRef,imageTitleParis.size.width,imageTitleParis.size.height);} completion:^(BOOL finished){}];
        
        [self.bannerZoo setImage:imageTitleZoo];
        self.bannerZoo.frame = CGRectMake(1.1*heightRef,0.7*widthRef,imageTitleZoo.size.width,imageTitleZoo.size.height);
        self.bannerZoo.alpha = 1.0;
        [self.view addSubview:self.bannerZoo];
        [UIView animateWithDuration:1.05 delay:0.85 options:UIViewAnimationCurveEaseInOut animations:^{self.bannerZoo.frame = CGRectMake(0.52*heightRef,0.7*widthRef, imageTitleZoo.size.width, imageTitleZoo.size.height);} completion:^(BOOL finished){if(finished)[self enableAllButtons];}];
    }
    else
    {
        imageTitleTheNew= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LeNouveau" ofType:@"png"]];
        imageTitleParis = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DeParis" ofType:@"png"]];
        imageTitleZoo   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ZooFr" ofType:@"png"]];

        [self.bannerTheNew setImage:imageTitleTheNew];
        self.bannerTheNew.frame = CGRectMake(0.02*heightRef,-0.30*widthRef,imageTitleTheNew.size.width, imageTitleTheNew.size.height);
		self.bannerTheNew.alpha = 1.0;
		[self.view addSubview:self.bannerTheNew];
		[UIView animateWithDuration:1.05 delay:0.25 options:UIViewAnimationCurveEaseInOut animations:^{[UIView setAnimationDelegate:self]; self.bannerTheNew.frame = CGRectMake(0.02*heightRef,0.07*widthRef,imageTitleTheNew.size.width,imageTitleTheNew.size.height);} completion:^(BOOL finished){}];
        
        [self.bannerParis setImage:imageTitleParis];
        self.bannerParis.frame = CGRectMake(1.1*heightRef,0.6*widthRef, imageTitleParis.size.width, imageTitleParis.size.height);
		self.bannerParis.alpha = 1.0;
		[self.view addSubview:self.bannerParis];
		[UIView animateWithDuration:1.05 delay:0.55 options:UIViewAnimationCurveEaseInOut animations:^{[UIView setAnimationDelegate:self]; self.bannerParis.frame = CGRectMake(0.45*heightRef,0.6*widthRef, imageTitleParis.size.width, imageTitleParis.size.height);} completion:^(BOOL finished){}];
    

        [self.bannerZoo setImage:imageTitleZoo];
        self.bannerZoo.frame = CGRectMake(-0.65*heightRef,0.375*widthRef, imageTitleZoo.size.width, imageTitleZoo.size.height);
		self.bannerZoo.alpha = 1.0;
		[self.view addSubview:self.bannerZoo];
		[UIView animateWithDuration:1.05 delay:0.85 options:UIViewAnimationCurveEaseInOut animations:^{self.bannerZoo.frame = CGRectMake(0.325*heightRef,0.375*widthRef, imageTitleZoo.size.width, imageTitleZoo.size.height);} completion:^(BOOL finished){if(finished)[self enableAllButtons];}];
    }

	//chimpanzee
	//---------------------------
	[UIView beginAnimations:@"fallingMonkey" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelay:1.92];
	self.chimp.alpha=1.0;
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(chimpAnim)];
	[UIView commitAnimations];	
	
	//penguin
	//----------------------------
	[UIView beginAnimations:@"movingPenguin" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelay:2.25];
	self.penguin.frame = CGRectMake(0.9*heightRef,0.5*widthRef,imagePenguin.size.width,imagePenguin.size.height);
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];	

	//bat
	//----------------------------
	[self.view addSubview:bat];
	[UIView beginAnimations:@"movingBat" context:nil];
	[UIView setAnimationDelay:6.0];
	[UIView setAnimationDuration:0.5];
	self.bat.alpha = 1.0;	
	if([preferences boolForKey:@"language"]) self.bat.frame = CGRectMake(0.625*heightRef, 0.765*widthRef, imageBat.size.width, imageBat.size.height);
	else self.bat.frame = CGRectMake(0.585*heightRef, 0.65*widthRef, imageBat.size.width, imageBat.size.height);
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(batAnim)];
	[UIView commitAnimations];
	
	//balloon
	//---------------------------
	[self.view addSubview:self.balloon];
	[UIView beginAnimations:@"movingBalloon" context:nil];
	[UIView setAnimationDelay:0.75];
	[UIView setAnimationDuration:1.25];
	self.balloon.alpha = 1.0;
	self.balloon.frame = CGRectMake(0.242*heightRef,0.063*widthRef,imageBalloon.size.width,imageBalloon.size.height);
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
		
	if([preferences boolForKey:@"audio"]) [self playWelcomeSound];
}

-(void) chimpAnim{
	[self.chimp chimpAnim];
}

-(void) batAnim{
	[self.bat batAnim];
}

- (IBAction) buttonCastClicked: (id) sender
{
    [self deactivateAllButtons];
    buttonToAnimate=self.buttonCast;
    if([preferences boolForKey:@"language"])[self.castMenu changeLanguage:YES];
    else [self.castMenu changeLanguage:NO];
    [self animateView];
}
-(void) endAnimationButtonCast{
	[UIView beginAnimations:@"NavigatingMenu" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.view addSubview:self.castMenu.view];
    [UIView setAnimationDidStopSelector:@selector(enableAllButtons)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}
-(void) enableAllButtons{
    self.buttonCast.userInteractionEnabled   =YES;
    self.buttonAnimals.userInteractionEnabled=YES;
    self.buttonPuzzle.userInteractionEnabled =YES;
    self.buttonCredits.userInteractionEnabled=YES;
    self.buttonStart.userInteractionEnabled  =YES;
    self.buttonOptions.userInteractionEnabled=YES;
}

-(void) deactivateAllButtons{
    self.buttonCast.userInteractionEnabled   =NO;
    self.buttonCredits.userInteractionEnabled=NO;
    self.buttonPuzzle.userInteractionEnabled =NO;
    self.buttonStart.userInteractionEnabled  =NO;
    self.buttonAnimals.userInteractionEnabled=NO;
    self.buttonOptions.userInteractionEnabled=NO;
}

- (IBAction) buttonAnimalsClicked: (id) sender
{
    [self deactivateAllButtons];
    buttonToAnimate=self.buttonAnimals;
    if([preferences boolForKey:@"language"])[self.animalMenu changeLanguage:YES];
    else [self.animalMenu changeLanguage:NO];
    [self animateView];
}
-(void) endAnimationButtonAnimals{
    [UIView beginAnimations:@"NavigatingMenu2" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.view addSubview:self.animalMenu.view];
    [UIView setAnimationDidStopSelector:@selector(enableAllButtons)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}


- (IBAction) buttonStartClicked: (id) sender
{
    [self deactivateAllButtons];
    buttonToAnimate=self.buttonStart;
    [self animateView];
}
-(void) endAnimationButtonStart{
	[UIView beginAnimations:@"NavigatingMenu" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.view addSubview:self.bookPage.view];
	[UIView setAnimationDidStopSelector:@selector(bookAnimDone)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];	
}
- (void) bookAnimDone{
    int currentPage,currentText;
	currentPage = [self.bookPage currentPage];
    currentText = [self.bookPage currentText];
    [self.bookPage addSubViewText];
	if([preferences boolForKey:@"audio"] && currentPage != 0 && !(currentPage == 23 && currentText == 1) && currentPage != 24) [self.bookPage playPageSound:currentPage andText:currentText];
	if(currentPage == 0)  [self.bookPage page1Animated];
	if(currentPage == 23 && currentText == 1) [self.bookPage page24Animated];
	if(currentPage == 24) [self.bookPage page25Animated];
    [self enableAllButtons];
}


- (IBAction) buttonOptionsClicked: (id) sender{
	
    [self deactivateAllButtons];
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"buttonOptionsTouched" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.buttonOptions.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    [UIView setAnimationDidStopSelector:@selector(endAnimationButtonOptions)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}
-(void) endAnimationButtonOptions{
    
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"buttonOptionsTouchedDone" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.buttonOptions.transform = CGAffineTransformScale(affineTransform,1.0,1.0);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    [imageButtonCast    release];
    [imageButtonStart   release];
    [imageButtonCredits release];
    [imageButtonAnimals release];
    [imageButtonPuzzle  release];
    
	if([self.buttonOptions imageForState:UIControlStateNormal | UIControlStateSelected | UIControlStateHighlighted] == imageFrancais)
	{
        [self.buttonOptions setImage:imageEnglish forState:UIControlStateNormal ];
        imageButtonCast   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_LaClasse" ofType:@"png"]];
        imageButtonStart  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Lire" ofType:@"png"]];
        imageButtonCredits= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Glossaire" ofType:@"png"]];
        imageButtonAnimals= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_LesAnimaux" ofType:@"png"]];
        imageButtonPuzzle = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Jeux" ofType:@"png"]];
        [preferences setBool:NO forKey:@"language"]; //in French
        [self.bookPage changeTextLanguageToEnglish:NO];
    }
    else
    {
        [self.buttonOptions setImage:imageFrancais      forState:UIControlStateNormal ];
        imageButtonCast   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_The_Class" ofType:@"png"]];
        imageButtonStart  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Read" ofType:@"png"]];
        imageButtonCredits= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Glossary" ofType:@"png"]];
        imageButtonAnimals= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Animals" ofType:@"png"]];
        imageButtonPuzzle = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Title_Page_Button_Games" ofType:@"png"]];
        [preferences setBool:YES forKey:@"language"]; //in English
        [self.bookPage changeTextLanguageToEnglish:YES];
    }
    
    [self.buttonStart   setImage:imageButtonStart   forState:UIControlStateNormal];
    [self.buttonCast    setImage:imageButtonCast    forState:UIControlStateNormal];
    [self.buttonCredits setImage:imageButtonCredits forState:UIControlStateNormal];
    [self.buttonAnimals setImage:imageButtonAnimals forState:UIControlStateNormal];
    [self.buttonPuzzle  setImage:imageButtonPuzzle  forState:UIControlStateNormal];
    
	[preferences synchronize];
	[self bannerAnimation];
}

- (IBAction) buttonCreditsClicked: (id) sender
{
    [self deactivateAllButtons];
    buttonToAnimate=self.buttonCredits;
    if([preferences boolForKey:@"language"])[self.creditsMenu changeLanguage:YES];
    else [self.creditsMenu changeLanguage:NO];
    [self animateView];
}
-(void) endAnimationButtonCredits{	
	[UIView beginAnimations:@"NavigatingMenu" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.view addSubview:self.creditsMenu.view];
    [UIView setAnimationDidStopSelector:@selector(enableAllButtons)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

- (IBAction) buttonPuzzleClicked: (id) sender
{
    [self deactivateAllButtons];
    buttonToAnimate=self.buttonPuzzle;
    if([preferences boolForKey:@"language"])[self.gamesMenu changeLanguage:YES];
    else [self.gamesMenu changeLanguage:NO];
    [self animateView];
}
-(void) endAnimationButtonPuzzle{	
	[UIView beginAnimations:@"NavigatingMenu2" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.view addSubview:self.gamesMenu.view];
    [UIView setAnimationDidStopSelector:@selector(enableAllButtons)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

- (IBAction) buttonAudioClicked: (id) sender{
    
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"buttonAudioTouched" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.audioControl.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    self.gamesMenu.audioButton.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    self.puzzleMenu.audioButton.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    self.game3Menu.audioButton.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    self.game4Menu.audioButton.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    [UIView setAnimationDidStopSelector:@selector(endAnimationButtonAudio)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}
-(void) endAnimationButtonAudio{

    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"buttonAudioTouchedDone" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.audioControl.transform           = CGAffineTransformScale(affineTransform,1.0,1.0);
    self.gamesMenu.audioButton.transform  = CGAffineTransformScale(affineTransform,1.0,1.0);
    self.puzzleMenu.audioButton.transform = CGAffineTransformScale(affineTransform,1.0,1.0);
    self.game3Menu.audioButton.transform  = CGAffineTransformScale(affineTransform,1.0,1.0);
    self.game4Menu.audioButton.transform  = CGAffineTransformScale(affineTransform,1.0,1.0);
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
	if( [self.audioControl imageForState:UIControlStateNormal] == self.imageAudioOn){
		[self.audioControl           setImage:self.imageAudioOff forState:UIControlStateNormal ];
		[self.gamesMenu.audioButton  setImage:self.imageAudioOff forState:UIControlStateNormal ];
		[self.puzzleMenu.audioButton setImage:self.imageAudioOff forState:UIControlStateNormal ];
		[self.game3Menu.audioButton  setImage:self.imageAudioOff forState:UIControlStateNormal ];
		[self.game4Menu.audioButton  setImage:self.imageAudioOff forState:UIControlStateNormal ];
		[preferences setBool:NO forKey:@"audio"];
		[preferences synchronize];
	} else {
		[self.audioControl           setImage:self.imageAudioOn forState:UIControlStateNormal ];
		[self.gamesMenu.audioButton  setImage:self.imageAudioOn forState:UIControlStateNormal ];
		[self.puzzleMenu.audioButton setImage:self.imageAudioOn forState:UIControlStateNormal ];
		[self.game3Menu.audioButton  setImage:self.imageAudioOn forState:UIControlStateNormal ];
		[self.game4Menu.audioButton  setImage:self.imageAudioOn forState:UIControlStateNormal ];
		[preferences setBool:YES forKey:@"audio"];
		[preferences synchronize];
	}

    [player stop];
    [player release];
    player=nil;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURLRef error:&error];
    player.delegate=(id)self;
    player.volume = 1.0f;
    if([player prepareToPlay])[player play];
}


- (void) buttonAnimate: (UIButton *)button{
	[button setHidden:NO];
	[[button layer] addAnimation:self.buttonAnimation forKey:@"transform.scale"];
}


- (void) buttonsWillAppear:(BOOL) animated{
	[self.buttonAnimation setDuration:1.0];
	[self.buttonCast      setHidden:YES];
	[self.buttonOptions   setHidden:YES];
	[self.buttonStart     setHidden:YES];
	[self.buttonCredits   setHidden:YES];
	[self.buttonAnimals   setHidden:YES];
	[self.buttonPuzzle    setHidden:YES];
	[self performSelector:@selector(buttonAnimate:) withObject:self.buttonStart   afterDelay:2.5];
	[self performSelector:@selector(buttonAnimate:) withObject:self.buttonPuzzle  afterDelay:2.75];
	[self performSelector:@selector(buttonAnimate:) withObject:self.buttonCast    afterDelay:3.0];
	[self performSelector:@selector(buttonAnimate:) withObject:self.buttonAnimals afterDelay:3.25];
	[self performSelector:@selector(buttonAnimate:) withObject:self.buttonCredits afterDelay:3.5];
	[self performSelector:@selector(buttonAnimate:) withObject:self.buttonOptions afterDelay:3.75];
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
    if([buttonToAnimate isEqual:buttonCast])    [UIView setAnimationDidStopSelector:@selector(endAnimationButtonCast)];
    if([buttonToAnimate isEqual:buttonAnimals]) [UIView setAnimationDidStopSelector:@selector(endAnimationButtonAnimals)];
    if([buttonToAnimate isEqual:buttonStart])   [UIView setAnimationDidStopSelector:@selector(endAnimationButtonStart)];
    if([buttonToAnimate isEqual:buttonCredits]) [UIView setAnimationDidStopSelector:@selector(endAnimationButtonCredits)];
    if([buttonToAnimate isEqual:buttonPuzzle])  [UIView setAnimationDidStopSelector:@selector(endAnimationButtonPuzzle)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
	/*UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"WARNING:" message:@"Low Memory" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];*/
	[super didReceiveMemoryWarning];
}


- (void)viewDidUnload {
	self.bannerZoo        = nil;
	self.bannerTheNew     = nil;
	self.bannerParis      = nil;
    self.chimp            = nil;
	self.penguin          = nil;	
	self.bat              = nil;
	self.balloon          = nil;
    self.castMenu         = nil;
	self.animalMenu       = nil;
	self.creditsMenu      = nil;
	self.bookPage         = nil;
	self.puzzleMenu       = nil;
	self.gamesMenu        = nil;
	self.game2Menu        = nil;
	self.game3Menu        = nil;
	self.game4Menu        = nil;
	self.messages         = nil;
	self.messages2        = nil;
    self.confirmation     = nil;
    self.buttonAnimation  = nil;
	self.buttonCast       = nil;
	self.buttonStart      = nil;
	self.buttonOptions    = nil;
	self.buttonCredits    = nil;
	self.buttonAnimals    = nil;
	self.buttonPuzzle     = nil;
	self.imageView        = nil;
	self.imageAudioOn     = nil;
	self.imageAudioOff    = nil;
	[imageFrancais        release];
	[imageEnglish         release];
	[imageButtonCast      release];
	[imageButtonStart     release];
	[imageButtonCredits   release];
	[imageButtonAnimals   release];
	[imageButtonPuzzle    release];
	[imageTitleTheNew     release];  
	[imageTitleParis      release];
	[imageTitleZoo        release];
    [imageChimp           release];
    [imagePenguin         release];
    [imageBat             release];
    [imageBalloon         release];
    [soundFileURLRef      release];
    [soundTitleURL        release];
    [soundTitleURLFr      release];
	imageFrancais         = nil;
	imageEnglish          = nil;
	imageButtonCast       = nil;
	imageButtonStart      = nil;
	imageButtonCredits    = nil;
	imageButtonAnimals    = nil;
	imageButtonPuzzle     = nil;
	imageTitleTheNew      = nil;
	imageTitleParis       = nil;
	imageTitleZoo         = nil;
    imageChimp            = nil;
    imagePenguin          = nil;
    imageBat              = nil;
    imageBalloon          = nil;
    soundFileURLRef       = nil;
    soundTitleURL         = nil;
    soundTitleURLFr       = nil;
    [player release];
    player=nil;
	[super viewDidUnload];
}

- (void)dealloc {
    [buttonCast       release];
	[buttonStart      release];
	[buttonOptions    release];
	[buttonCredits    release];
	[buttonAnimals    release];
	[buttonPuzzle     release];
	[imageView        release];
    [castMenu         release];
	[creditsMenu      release];
	[animalMenu       release];
	[bookPage         release];
	[puzzleMenu       release];
	[gamesMenu        release];
	[game2Menu        release];
	[game3Menu        release];
	[game4Menu        release];
	[messages         release];
	[messages2        release];
    [confirmation     release];
	[bannerTheNew     release];
	[bannerParis      release];
	[bannerZoo        release];
	[chimp            release];
	[penguin          release];
	[bat              release];
	[balloon          release];
	[buttonAnimation  release];
    [imageAudioOn       release];
	[imageAudioOff      release];
	[imageFrancais      release];
	[imageEnglish       release];
	[imageButtonCast    release];
	[imageButtonStart   release];
	[imageButtonCredits release];
	[imageButtonAnimals release];
	[imageButtonPuzzle  release];
	[imageTitleTheNew   release];
	[imageTitleParis    release];
	[imageTitleZoo      release];
    [imageChimp         release];
    [imagePenguin       release];
    [imageBat           release];
    [imageBalloon       release];
    [soundFileURLRef release];
    [soundTitleURL   release];
    [soundTitleURLFr release];
    [player          release];
	[super dealloc];
}


@end
