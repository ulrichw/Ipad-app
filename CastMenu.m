//
//  CastMenu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "CastMenu.h"
#import "MainMenu.h"
#import "ChimpView.h"
#import "PenguinView.h"
#import "BatView.h"
#import "BalloonView.h"

@implementation CastMenu

@synthesize backButton,imageView;
@synthesize characterView;
@synthesize Amine,Amrita,Antoine,Dominic,Enzo,Eric,Gilbert,Lily,Mayra,MsPetit,Ousmane,Paulette,Rafa,Sofia,Sylvie,Yasmine;
@synthesize caller;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
	{
		[super viewDidLoad];

        preferences = [NSUserDefaults standardUserDefaults];
            
		widthRef   =768;
		heightRef  =1024;
	
        listOfCharacters   = [[NSArray alloc] initWithObjects:@"Character_lineup_Page_Mme_Petit",@"Character_lineup_Page_Amine",@"Character_lineup_Page_Amrita",@"Character_lineup_Page_Antoine",@"Character_lineup_Page_Dominic",@"Character_lineup_Page_Enzo",@"Character_lineup_Page_Eric",@"Character_lineup_Page_Gilbert",@"Character_lineup_Page_Lily",@"Character_lineup_Page_Mayra",@"Character_lineup_Page_Ousmane",@"Character_lineup_Page_Paulette",@"Character_lineup_Page_Rafa",@"Character_lineup_Page_Sofia",@"Character_lineup_Page_Sylvie",@"Character_lineup_Page_Yasmine",nil];
        listOfCharactersFr = [[NSArray alloc] initWithObjects:@"Character_lineup_Page_French_Mme_Petit",@"Character_lineup_Page_French_Amine",@"Character_lineup_Page_French_Amrita",@"Character_lineup_Page_French_Antoine",@"Character_lineup_Page_French_Dominic",@"Character_lineup_Page_French_Enzo",@"Character_lineup_Page_French_Eric",@"Character_lineup_Page_French_Gilbert",@"Character_lineup_Page_French_Lily",@"Character_lineup_Page_French_Mayra",@"Character_lineup_Page_French_Ousmane",@"Character_lineup_Page_French_Paulette",@"Character_lineup_Page_French_Rafa",@"Character_lineup_Page_French_Sofia",@"Character_lineup_Page_French_Sylvie",@"Character_lineup_Page_French_Yasmine",nil];

        if([preferences boolForKey:@"language"])
        {
            character = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfCharacters objectAtIndex:0] ofType:@"png"]];
            characterLineup  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris_Zoo_Character_Lineup" ofType:@"jpg"]];
        }
        else
        {
            character = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfCharactersFr objectAtIndex:0] ofType:@"png"]];
            characterLineup  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris_Zoo_Character_Lineup_fr" ofType:@"jpg"]];
        }
        [self.imageView setImage:characterLineup];
        
        characterView = [[UIImageView alloc] initWithImage:character];
		self.characterView.userInteractionEnabled = YES;
		self.characterView.alpha = 1.0;
		self.characterView.opaque= YES;
		self.characterView.frame = CGRectMake(0.5*heightRef-character.size.width*0.5,0.5*widthRef-character.size.height*0.5,character.size.width,character.size.height);	
 		
        nullImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NULL" ofType:@"png"]];
        
		characterDisplayed = -1; //no character is zoomed-in
        
        self.backButton.exclusiveTouch=YES;
        self.Amine.exclusiveTouch=YES;
        self.Amrita.exclusiveTouch=YES;
        self.Antoine.exclusiveTouch=YES;
        self.Dominic.exclusiveTouch=YES;
        self.Enzo.exclusiveTouch=YES;
        self.Eric.exclusiveTouch=YES;
        self.Gilbert.exclusiveTouch=YES;
        self.Lily.exclusiveTouch=YES;
        self.Mayra.exclusiveTouch=YES;
        self.MsPetit.exclusiveTouch=YES;
        self.Ousmane.exclusiveTouch=YES;
        self.Paulette.exclusiveTouch=YES;
        self.Rafa.exclusiveTouch=YES;
        self.Sofia.exclusiveTouch=YES;
        self.Sylvie.exclusiveTouch=YES;
        self.Yasmine.exclusiveTouch=YES;
        
        isInitialized = 1001;
}

- (void) changeLanguage: (BOOL) English{
    
       if(isInitialized == 1001)
       {
        [characterLineup release];
           
        if(English) characterLineup  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris_Zoo_Character_Lineup" ofType:@"jpg"]];
        else characterLineup         = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris_Zoo_Character_Lineup_fr" ofType:@"jpg"]];
        [self.imageView  setImage:characterLineup];
       }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (IBAction) backButtonClicked{
    [self deactivateAllButtons];
	[self animateView];
}
- (void) animationBackButtonDone{
    self.caller.penguin.alpha     =0.0;
    self.caller.chimp.alpha       =0.0;
	self.caller.bat.alpha         =0.0;
	self.caller.balloon.alpha     =0.0;
    self.caller.bannerTheNew.alpha=0.0;
    self.caller.bannerParis.alpha =0.0;
    self.caller.bannerZoo.alpha   =0.0;

    [self.characterView removeFromSuperview];
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
    [characterLineup release];
    characterLineup=nil;
    [self.imageView  setImage:nullImage];
	[self.caller bannerAnimation];
	//if([preferences boolForKey:@"audio"]) [self.caller playWelcomeSound];
    [self enableAllButtons];
}

- (void) deactivateAllButtons{
    backButton.userInteractionEnabled=NO;
	Amine.userInteractionEnabled=NO;
	Amrita.userInteractionEnabled=NO;
	Antoine.userInteractionEnabled=NO;
	Dominic.userInteractionEnabled=NO;
	Enzo.userInteractionEnabled=NO;
	Eric.userInteractionEnabled=NO;
	Gilbert.userInteractionEnabled=NO;
	Lily.userInteractionEnabled=NO;
	Mayra.userInteractionEnabled=NO;
	MsPetit.userInteractionEnabled=NO;
	Ousmane.userInteractionEnabled=NO;
	Paulette.userInteractionEnabled=NO;
	Rafa.userInteractionEnabled=NO;
	Sofia.userInteractionEnabled=NO;
	Sylvie.userInteractionEnabled=NO;
	Yasmine.userInteractionEnabled=NO;    
}

- (void) enableAllButtons{
    backButton.userInteractionEnabled=YES;
	Amine.userInteractionEnabled=YES;
	Amrita.userInteractionEnabled=YES;
	Antoine.userInteractionEnabled=YES;
	Dominic.userInteractionEnabled=YES;
	Enzo.userInteractionEnabled=YES;
	Eric.userInteractionEnabled=YES;
	Gilbert.userInteractionEnabled=YES;
	Lily.userInteractionEnabled=YES;
	Mayra.userInteractionEnabled=YES;
	MsPetit.userInteractionEnabled=YES;
	Ousmane.userInteractionEnabled=YES;
	Paulette.userInteractionEnabled=YES;
	Rafa.userInteractionEnabled=YES;
	Sofia.userInteractionEnabled=YES;
	Sylvie.userInteractionEnabled=YES;
	Yasmine.userInteractionEnabled=YES;
}

- (IBAction) amineButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=1;
    [self buttonClicked];
}
- (IBAction) amritaButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=2;
    [self buttonClicked];
}
- (IBAction) antoineButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=3;
    [self buttonClicked];
}
- (IBAction) dominicButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=4;
    [self buttonClicked];
}
- (IBAction) enzoButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=5;
    [self buttonClicked];
}
- (IBAction) ericButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=6;
    [self buttonClicked];
}
- (IBAction) gilbertButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=7;
    [self buttonClicked];
}
- (IBAction) lilyButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=8;
    [self buttonClicked];
}
- (IBAction) mayraButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=9;
    [self buttonClicked];
}
- (IBAction) mspetitButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=0;
    [self buttonClicked];
}
- (IBAction) ousmaneButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=10;
    [self buttonClicked];
}
- (IBAction) pauletteButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=11;
    [self buttonClicked];
}
- (IBAction) rafaButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=12;
    [self buttonClicked];
}
- (IBAction) sofiaButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=13;
    [self buttonClicked];
}
- (IBAction) sylvieButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=14;
    [self buttonClicked];
}
- (IBAction) yasmineButtonClicked: (id) sender{
    [self deactivateAllButtons];
    characterIndex=15;
    [self buttonClicked];
}
- (void) buttonClicked{
    [character release];
    [self.characterView removeFromSuperview];
    if([preferences boolForKey:@"language"]) character = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfCharacters objectAtIndex:characterIndex] ofType:@"png"]];
    else character = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfCharactersFr objectAtIndex:characterIndex] ofType:@"png"]];
	[self.characterView setImage:character];
    [self.view addSubview:self.characterView];
    characterDisplayed=characterIndex;
    [self enableAllButtons];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == self.characterView) [self.characterView removeFromSuperview];
}

- (void) animateView{
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"buttonTouched" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    self.backButton.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    [UIView setAnimationDidStopSelector:@selector(animateViewDone)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

- (void) animateViewDone{
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
	[UIView beginAnimations:@"buttonTouchedDone" context:nil];
	[UIView setAnimationDuration:0.15];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.backButton.transform = CGAffineTransformScale(affineTransform,1.0,1.0);
    [UIView setAnimationDidStopSelector:@selector(animationBackButtonDone)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	self.backButton   = nil;
	self.imageView    = nil;
	self.Amine        = nil;
	self.Amrita       = nil;
	self.Antoine      = nil;
	self.Dominic      = nil;
	self.Enzo         = nil;
	self.Eric         = nil;
	self.Gilbert      = nil;
	self.Lily         = nil;
	self.Mayra        = nil;
	self.MsPetit      = nil;
	self.Ousmane      = nil;
	self.Paulette     = nil;
	self.Rafa         = nil;
	self.Sofia        = nil;
	self.Sylvie       = nil;
	self.Yasmine      = nil;
    self.characterView= nil;
    [character          release];
    [characterLineup    release];
    [listOfCharacters   release];
    [listOfCharactersFr release];
    [nullImage          release];
    character         = nil;
    characterLineup   = nil;
    listOfCharacters  = nil;
    listOfCharactersFr= nil;
    nullImage         = nil;
    isInitialized     = 0;
	[super viewDidUnload];
}



- (void)dealloc {
	
	[backButton release];
	[imageView  release];
	[Amine      release];
	[Amrita     release];
	[Antoine    release];
	[Dominic    release];
	[Enzo       release];
	[Eric       release];
	[Gilbert    release];
	[Lily       release];
	[Mayra      release];
	[MsPetit    release];
	[Ousmane    release];
	[Paulette   release];
	[Rafa       release];
	[Sofia      release];
	[Sylvie     release];
	[Yasmine    release];
    [nullImage  release];
	[characterView      release];
	[caller             release];
    [character          release];
    [characterLineup    release];
    [listOfCharacters   release];
    [listOfCharactersFr release];
    [super dealloc];
}


@end
