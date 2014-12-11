    //
//  GamesMenu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 1/29/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "MainMenu.h"
#import "GamesMenu.h"
#import "PuzzleMenu.h"
#import "Game2Menu.h"
#import "Game3Menu.h"
#import "Game4Menu.h"
#import "ChimpView.h"
#import "PenguinView.h"
#import "BatView.h"
#import "BalloonView.h"

@implementation GamesMenu

@synthesize buttonPuzzle,buttonAnimals,buttonBalloons,backButton,caller,backgroundView,titleImage,frenchEnglishButton,audioButton;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

    [super viewDidLoad];
    
	preferences = [NSUserDefaults standardUserDefaults];

    self.caller.puzzleMenu.caller2 = self;
	self.caller.game2Menu.caller2  = self;
	self.caller.game3Menu.caller2  = self;
	self.caller.game4Menu.caller2  = self;
    
	[self.caller setImageForAudioButtons];
	
    nullImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NULL" ofType:@"png"]];

    BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BKGD_Games_page" ofType:@"jpg"]];
    [self.backgroundView setImage:BKGDImage];
    
    isInitialized = 1001;
    
    self.buttonPuzzle.exclusiveTouch       =YES;
	self.buttonAnimals.exclusiveTouch      =YES;
	self.buttonBalloons.exclusiveTouch     =YES;
	self.backButton.exclusiveTouch         =YES;
	self.frenchEnglishButton.exclusiveTouch=YES;
	self.audioButton.exclusiveTouch        =YES;

	if([preferences boolForKey:@"language"]) [self changeLanguage:YES];
	else [self changeLanguage:NO];
}


- (void) changeLanguage: (BOOL) englishLanguage{

    if(isInitialized == 1001){

        [puzzleEnFr     release];
        [animalsEnFr    release];
        [balloonsEnFr   release];
        [wordmatchEnFr  release];
        [titleImageEnFr release];
        [BKGDImage      release];
        
        if(englishLanguage) //if it's in English
	{
        puzzleEnFr = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Button_JigsawPuzzle" ofType:@"png"]];
        animalsEnFr= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Button_AnimalSoundsMatch" ofType:@"png"]];
        balloonsEnFr=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Button_BalloonPop" ofType:@"png"]];
        wordmatchEnFr=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Button_WordGame" ofType:@"png"]];
        titleImageEnFr= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Games_Page_Title" ofType:@"png"]];
		[self.buttonPuzzle        setImage:puzzleEnFr    forState:UIControlStateNormal ];
		[self.buttonAnimals       setImage:animalsEnFr   forState:UIControlStateNormal ];
		[self.buttonBalloons      setImage:balloonsEnFr  forState:UIControlStateNormal ];
		[self.frenchEnglishButton setImage:wordmatchEnFr forState:UIControlStateNormal ];
		[self.titleImage          setImage:titleImageEnFr]; 
	}
	else 
	{
        puzzleEnFr=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_Puzzle" ofType:@"png"]];
        animalsEnFr=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_SonsDesAnimaux" ofType:@"png"]];
        balloonsEnFr= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_JeuPerceBallons" ofType:@"png"]];
        wordmatchEnFr= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_JeuDeMots" ofType:@"png"]];
        titleImageEnFr= [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Games_Page_Title" ofType:@"png"]];
        [self.buttonPuzzle        setImage:puzzleEnFr    forState:UIControlStateNormal ];
		[self.buttonAnimals       setImage:animalsEnFr   forState:UIControlStateNormal ];
		[self.buttonBalloons      setImage:balloonsEnFr  forState:UIControlStateNormal ];
		[self.frenchEnglishButton setImage:wordmatchEnFr forState:UIControlStateNormal ];
		[self.titleImage          setImage:titleImageEnFr]; 
	}
        BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BKGD_Games_page" ofType:@"jpg"]];
        [self.backgroundView setImage:BKGDImage];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (IBAction) buttonPuzzleClicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.buttonPuzzle;
    if([preferences boolForKey:@"language"])[self.caller.puzzleMenu changeTitleLanguage:YES];
    else [self.caller.puzzleMenu changeTitleLanguage:NO];
    [self.caller.puzzleMenu createPieces];
    [self animateView];
}
-(void) endAnimationButtonPuzzle{
	[UIView beginAnimations:@"PuzzleMenu" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.view addSubview:self.caller.puzzleMenu.view];
    [UIView setAnimationDidStopSelector:@selector(enableAllButtons)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

-(void) enableAllButtons{
    self.buttonPuzzle.userInteractionEnabled       =YES;
    self.buttonAnimals.userInteractionEnabled      =YES;
    self.frenchEnglishButton.userInteractionEnabled=YES;
    self.buttonBalloons.userInteractionEnabled     =YES;
    self.backButton.userInteractionEnabled         =YES;
}

- (void) deactivateAllButtons{
    self.buttonPuzzle.userInteractionEnabled       =NO;
    self.buttonAnimals.userInteractionEnabled      =NO;
    self.frenchEnglishButton.userInteractionEnabled=NO;
    self.buttonBalloons.userInteractionEnabled     =NO;
    self.backButton.userInteractionEnabled         =NO;
}


- (IBAction) buttonAnimalsClicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.buttonAnimals;
    if([preferences boolForKey:@"language"])[self.caller.game2Menu changeTitleLanguage:YES];
    else [self.caller.game2Menu changeTitleLanguage:NO];
    [self animateView];
}
-(void) endAnimationButtonAnimals{
	[UIView beginAnimations:@"Game2Menu" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.view addSubview:self.caller.game2Menu.view];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(createViewsGame)];
	[UIView commitAnimations];
    [self enableAllButtons];
}

- (IBAction) buttonBalloonsClicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.buttonBalloons;
    if([preferences boolForKey:@"language"])[self.caller.game3Menu changeTitleLanguage:YES];
    else [self.caller.game3Menu changeTitleLanguage:NO];
    [self animateView];
}
-(void) endAnimationButtonBallons{

    [self.caller.game3Menu startCloudTimer]; //start the cloud animation
	[self.caller.game3Menu startOverCalled]; //we start the balloon animation
	[UIView beginAnimations:@"Game3Menu" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.view addSubview:self.caller.game3Menu.view];
    [UIView setAnimationDidStopSelector:@selector(enableAllButtons)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

- (IBAction) buttonAudioClicked: (id) sender{
	
	[self.caller buttonAudioClicked:sender];
}


- (void) createViewsGame{
    [self.caller.game2Menu createViews];
	[self.caller.game2Menu playSoundClicked];
}

- (IBAction) backButtonClicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.backButton;
    [self animateView];
}
-(void) endAnimationBackButton{
    self.caller.penguin.alpha     =0.0;
    self.caller.chimp.alpha       =0.0;
	self.caller.bat.alpha         =0.0;
	self.caller.balloon.alpha     =0.0;
    self.caller.bannerTheNew.alpha=0.0;
    self.caller.bannerParis.alpha =0.0;
    self.caller.bannerZoo.alpha   =0.0;
    
    [self.caller deactivateAllButtons];
	[UIView beginAnimations:@"NavigatingMenu" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view.superview cache:NO];
	[self.view removeFromSuperview];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(cleanBackButton)];
	[UIView commitAnimations];
}
- (void) cleanBackButton{
    [BKGDImage release];
     BKGDImage=nil;
    [self.backgroundView setImage:BKGDImage];
	[self.caller bannerAnimation];
	//if([preferences boolForKey:@"audio"]) [self.caller playWelcomeSound];
	[self enableAllButtons];
}

- (IBAction) frenchEnglishButtonClicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.frenchEnglishButton;
    if([preferences boolForKey:@"language"])[self.caller.game4Menu changeTitleLanguage:YES];
    else [self.caller.game4Menu changeTitleLanguage:NO];
    [self animateView];
}
-(void) endAnimationFrenchEnglishButton{

    [UIView beginAnimations:@"NavigatingMenu2" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
	[self.caller.game4Menu startOverCalled];
	[self.view addSubview:self.caller.game4Menu.view];
    [UIView setAnimationDidStopSelector:@selector(enableAllButtons)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
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
    if([buttonToAnimate isEqual:self.buttonPuzzle])        [UIView setAnimationDidStopSelector:@selector(endAnimationButtonPuzzle)];
    if([buttonToAnimate isEqual:self.buttonAnimals])       [UIView setAnimationDidStopSelector:@selector(endAnimationButtonAnimals)];
    if([buttonToAnimate isEqual:self.buttonBalloons])      [UIView setAnimationDidStopSelector:@selector(endAnimationButtonBallons)];
    if([buttonToAnimate isEqual:self.frenchEnglishButton]) [UIView setAnimationDidStopSelector:@selector(endAnimationFrenchEnglishButton)];
    if([buttonToAnimate isEqual:self.backButton])          [UIView setAnimationDidStopSelector:@selector(endAnimationBackButton)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	
	self.buttonPuzzle  = nil;
	self.buttonAnimals = nil;
	self.backButton    = nil;
	self.buttonBalloons= nil;
	self.backgroundView= nil;
	self.frenchEnglishButton=nil;
	self.titleImage    = nil;
	self.audioButton   = nil;
	
	[puzzleEnFr     release];
	[animalsEnFr    release];
	[balloonsEnFr   release];
	[wordmatchEnFr  release];
	[titleImageEnFr release];
    [BKGDImage      release];
    [nullImage      release];
	puzzleEnFr    = nil;
	animalsEnFr   = nil;
	balloonsEnFr  = nil;
	wordmatchEnFr = nil;
	titleImageEnFr= nil;
	BKGDImage     = nil;
    nullImage     = nil;
    isInitialized=0;
	[super viewDidUnload];
}


- (void)dealloc {
	[buttonPuzzle        release];
	[buttonAnimals       release];
	[backButton          release];
	[buttonBalloons      release];
	[backgroundView      release];
	[titleImage          release];
	[frenchEnglishButton release];
    [caller              release];
	[puzzleEnFr          release];
	[animalsEnFr         release];
	[balloonsEnFr        release];
	[wordmatchEnFr       release];
	[titleImageEnFr      release];
    [BKGDImage           release];
    [nullImage           release];
	[super dealloc];
}


@end
