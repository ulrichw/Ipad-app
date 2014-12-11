    //
//  CreditsMenu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "CreditsMenu.h"
#import "MainMenu.h"
#import "ChimpView.h"
#import "PenguinView.h"
#import "BatView.h"
#import "BalloonView.h"

@implementation CreditsMenu

@synthesize backButton;
@synthesize caller,mammal,omnivore,backgroundPage,species,migration,capable,ultrasonic,social,habitat,extinct,enclosure,endangered,solitary,domestic,carnivore,herbivore;

- (void)viewDidLoad {
    [super viewDidLoad];

    preferences = [NSUserDefaults standardUserDefaults];
    
    if([preferences boolForKey:@"language"]){
        page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page" ofType:@"jpg"]];
        [self.backgroundPage setImage:page];

    } else{
        page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page_french" ofType:@"jpg"]];
        [self.backgroundPage setImage:page];

    }
    
    listOfPopup = [[NSArray alloc] initWithObjects:@"Glossary_English_Mammal",@"Glossary_English_Species",@"Glossary_English_Migration",@"Glossary_English_Capable",@"Glossary_English_Ultrasonic",@"Glossary_English_Social",@"Glossary_English_Habitat",@"Glossary_English_Extinct",@"Glossary_English_Enclosure",@"Glossary_English_Endangered",@"Glossary_English_Solitary",@"Glossary_English_Omnivore",@"Glossary_English_Domestic",@"Glossary_English_Carnivore",@"Glossary_English_Herbivore",nil];
    listOfPopupFr = [[NSArray alloc] initWithObjects:@"Glossary_French_Mammal",@"Glossary_French_Species",@"Glossary_French_Migration",@"Glossary_French_Capable",@"Glossary_French_Ultrasonic",@"Glossary_French_Social",@"Glossary_French_Habitat",@"Glossary_French_Extinct",@"Glossary_French_Enclosure",@"Glossary_French_Endangered",@"Glossary_French_Solitary",@"Glossary_French_Omnivore",@"Glossary_French_Domestic",@"Glossary_French_Carnivore",@"Glossary_French_Herbivore",nil];

    widthRef   =768;//[[UIScreen mainScreen] bounds].size.width;
	heightRef  =1024;//[[UIScreen mainScreen] bounds].size.height;
    
    if([preferences boolForKey:@"language"]) popUpImages = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfPopup objectAtIndex:0] ofType:@"png"]];
    else popUpImages = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfPopupFr objectAtIndex:0] ofType:@"png"]];
    
    popUpImage = [[UIImageView alloc] initWithImage:popUpImages];
	popUpImage.frame = CGRectMake(0.5*heightRef-popUpImages.size.width*0.5,0.5*widthRef-popUpImages.size.height*0.5,
                                           popUpImages.size.width,popUpImages.size.height);
    popUpImage.userInteractionEnabled=YES;
    
    popUpDisplayed=-1;
    
    nullImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NULL" ofType:@"png"]];
    
    isInitialized = 1001;

    self.backButton.exclusiveTouch=YES;
    self.mammal.exclusiveTouch    =YES;
    self.species.exclusiveTouch   =YES;
    self.migration.exclusiveTouch =YES;
    self.capable.exclusiveTouch   =YES;
    self.ultrasonic.exclusiveTouch=YES;
    self.social.exclusiveTouch    =YES;
    self.habitat.exclusiveTouch   =YES;
    self.extinct.exclusiveTouch   =YES;
    self.enclosure.exclusiveTouch =YES;
    self.endangered.exclusiveTouch=YES;
    self.solitary.exclusiveTouch  =YES;
    self.omnivore.exclusiveTouch  =YES;
    self.domestic.exclusiveTouch  =YES;
    self.carnivore.exclusiveTouch =YES;
    self.herbivore.exclusiveTouch =YES;

}

- (void) changeLanguage: (BOOL) English{
    
    if(isInitialized == 1001){
	if(English){
        [page release];
        page=nil;
        page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page" ofType:@"jpg"]];
        [self.backgroundPage setImage:page];
    }
    else{
        [page release];
        page=nil;
        page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page_french" ofType:@"jpg"]];
        [self.backgroundPage setImage:page];
    }}
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
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

    [popUpImage removeFromSuperview];
    [self.backgroundPage setImage:page];
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
    [page release];
    page=nil;
    [self.backgroundPage  setImage:nullImage];
	[self.caller bannerAnimation];
	//if([preferences boolForKey:@"audio"]) [self.caller playWelcomeSound];
    [self enableAllButtons];
}

- (void) enableAllButtons{
    backButton.userInteractionEnabled=YES;
    mammal.userInteractionEnabled=YES;
    species.userInteractionEnabled=YES;
    migration.userInteractionEnabled=YES;
    capable.userInteractionEnabled=YES;
    ultrasonic.userInteractionEnabled=YES;
    social.userInteractionEnabled=YES;
    habitat.userInteractionEnabled=YES;
    extinct.userInteractionEnabled=YES;
    enclosure.userInteractionEnabled=YES;
    endangered.userInteractionEnabled=YES;
    solitary.userInteractionEnabled=YES;
    omnivore.userInteractionEnabled=YES;
    domestic.userInteractionEnabled=YES;
    carnivore.userInteractionEnabled=YES;
    herbivore.userInteractionEnabled=YES;
}

- (void) deactivateAllButtons{
    backButton.userInteractionEnabled=NO;
    mammal.userInteractionEnabled=NO;
    species.userInteractionEnabled=NO;
    migration.userInteractionEnabled=NO;
    capable.userInteractionEnabled=NO;
    ultrasonic.userInteractionEnabled=NO;
    social.userInteractionEnabled=NO;
    habitat.userInteractionEnabled=NO;
    extinct.userInteractionEnabled=NO;
    enclosure.userInteractionEnabled=NO;
    endangered.userInteractionEnabled=NO;
    solitary.userInteractionEnabled=NO;
    omnivore.userInteractionEnabled=NO;
    domestic.userInteractionEnabled=NO;
    carnivore.userInteractionEnabled=NO;
    herbivore.userInteractionEnabled=NO;
}

- (IBAction) animalButtonClicked: (id) sender{
    
    [self deactivateAllButtons];
        if(sender == (id)mammal)      popUpIndex=0;
        if(sender == (id)species)     popUpIndex=1;
        if(sender == (id)migration)   popUpIndex=2;
        if(sender == (id)capable)     popUpIndex=3;
        if(sender == (id)ultrasonic)  popUpIndex=4;
        if(sender == (id)social)      popUpIndex=5;
        if(sender == (id)habitat)     popUpIndex=6;
        if(sender == (id)extinct)     popUpIndex=7;
        if(sender == (id)enclosure)   popUpIndex=8;
        if(sender == (id)endangered)  popUpIndex=9;
        if(sender == (id)solitary)    popUpIndex=10;
        if(sender == (id)omnivore)    popUpIndex=11;
        if(sender == (id)domestic)    popUpIndex=12;
        if(sender == (id)carnivore)   popUpIndex=13;
        if(sender == (id)herbivore)   popUpIndex=14;
        if(popUpIndex != popUpDisplayed){
            [page release];
            if([preferences boolForKey:@"language"]) page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page_dark" ofType:@"jpg"]];
            else page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page_dark_french" ofType:@"jpg"]];
            [backgroundPage setImage:page];
            [self buttonClicked];
        }
        else{
            [popUpImage removeFromSuperview];
            [page release];
            if([preferences boolForKey:@"language"]) page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page" ofType:@"jpg"]];
            else page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page_french" ofType:@"jpg"]];
            popUpDisplayed=-1;
            [backgroundPage setImage:page];
            [self enableAllButtons];
        }
}
- (void) buttonClicked{
    [popUpImages release];
    [popUpImage removeFromSuperview];
    if([preferences boolForKey:@"language"]) popUpImages = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfPopup objectAtIndex:popUpIndex] ofType:@"png"]];
    else popUpImages = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfPopupFr objectAtIndex:popUpIndex] ofType:@"png"]];
	[popUpImage setImage:popUpImages];
    [self.view addSubview:popUpImage];
    popUpDisplayed=popUpIndex;
    [self enableAllButtons];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
    UITouch *touch = [touches anyObject];
    if ([touch view] != (id)mammal && [touch view] != (id)species && [touch view] != (id)migration && [touch view] != (id)capable && [touch view] != (id)ultrasonic && [touch view] != (id)social && [touch view] != (id)habitat && [touch view] != (id)extinct && [touch view] != (id)enclosure && [touch view] != (id)endangered && [touch view] != (id)solitary && [touch view] != (id)omnivore && [touch view] != (id)domestic && [touch view] != (id)carnivore && [touch view] != (id)herbivore){
        [popUpImage removeFromSuperview];
        [page release];
        if([preferences boolForKey:@"language"]) page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page" ofType:@"jpg"]];
        else page = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Glossary_page_french" ofType:@"jpg"]];
        [backgroundPage setImage:page];
        popUpDisplayed=-1;
    }
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
    self.backButton = nil;
    self.mammal     = nil;
    self.omnivore   = nil;
    self.species    = nil;
    self.migration  = nil;
    self.capable    = nil;
    self.ultrasonic = nil;
    self.social     = nil;
    self.habitat    = nil;
    self.extinct    = nil;
    self.enclosure  = nil;
    self.endangered = nil;
    self.solitary   = nil;
    self.domestic   = nil;
    self.carnivore  = nil;
    self.herbivore  = nil;
    self.backgroundPage= nil;
    [popUpImages   release];
    [popUpImage    release];
    [listOfPopup   release];
    [listOfPopupFr release];
    [nullImage     release];
    [page          release];
    popUpImages     = nil;
    popUpImage      = nil;
    listOfPopup     = nil;
    listOfPopupFr   = nil;
    nullImage       = nil;
    page            = nil;
    isInitialized   = 0;
	[super viewDidUnload];
}



- (void)dealloc {
    [backButton     release];
    [caller         release];
    [mammal         release];
    [omnivore       release];
    [species        release];
    [migration      release];
    [capable        release];
    [ultrasonic     release];
    [social         release];
    [habitat        release];
    [extinct        release];
    [enclosure      release];
    [endangered     release];
    [solitary       release];
    [domestic       release];
    [carnivore      release];
    [herbivore      release];
    [backgroundPage release];
    [page           release];
    [popUpImage     release];
    [nullImage      release];
    [popUpImages    release];
    [popUpImage     release];
    [listOfPopup    release];
    [listOfPopupFr  release];
	[super dealloc];
}


@end
