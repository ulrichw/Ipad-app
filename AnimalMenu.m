//
//  AnimalMenu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/26/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "AnimalMenu.h"
#import "ChimpView.h"
#import "PenguinView.h"
#import "BatView.h"
#import "BalloonView.h"

@implementation AnimalMenu

@synthesize backButton,caller;
@synthesize animalView;
@synthesize elephants,lion,bear,chimpanzee,bats,wildebeest,otters,tigers,giraffe,giraffe2,gorilla,peacock;
@synthesize snakes,penguin,lamb,duckling,piglet,kid;
@synthesize animalLineup;

- (void)viewDidLoad {
    [super viewDidLoad];
	   
	preferences = [NSUserDefaults standardUserDefaults];
	
	widthRef   =768; 
	heightRef  =1024;
	
    listOfAnimals  = [[NSArray alloc] initWithObjects: @"English_Elephant_Infocard",@"English_Lion_Infocard",@"English_Bear_Infocard",@"English_Chimpanzee_Infocard",@"English_Bats_Infocard",@"English_Wildebeest_Infocard",@"English_SeaOtters_Infocard",@"English_Tiger_Infocard",@"English_Giraffe_Infocard",@"English_Gorilla_Infocard",@"English_Peacock_Infocard",@"English_Snakes_Infocard",@"English_Penguin_Infocard",@"English_Lamb_Infocard",@"English_Duckling_Infocard",@"English_Kid_Infocard",@"English_Piglet_Infocard",nil];
    listOfAnimalsFr= [[NSArray alloc] initWithObjects: @"French_Elephant_Infocard",@"French_Lion_Infocard",@"French_Bear_Infocard",@"French_Chimpanzee_Infocard",@"French_Bats_Infocard",@"French_Wildebeest_Infocard",@"French_SeaOtters_Infocard",@"French_Tiger_Infocard",@"French_Giraffe_Infocard",@"French_Gorilla_Infocard",@"French_Peacock_Infocard",@"French_Snakes_Infocard",@"French_Penguin_Infocard",@"French_Lamb_Infocard",@"French_Duckling_Infocard",@"French_Kid_Infocard",@"French_Piglet_Infocard",nil];
    
    animalSound[0]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"elephant" ofType: @"aiff"]]  retain];
    animalSound[1]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"roar" ofType: @"aiff"]]      retain];
	animalSound[2]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"bear" ofType: @"mp3"]]       retain];
	animalSound[3]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"chimpanzee" ofType: @"mp3"]] retain];
	animalSound[4]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"bats" ofType: @"mp3"]]       retain];
	animalSound[5]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"wildebeest" ofType: @"mp3"]] retain];
	animalSound[6]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"otter" ofType: @"mp3"]]      retain];
	animalSound[7]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"tiger" ofType: @"mp3"]]      retain];
	animalSound[8]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"giraffe" ofType: @"mp3"]]    retain];
	animalSound[9]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"gorilla" ofType: @"mp3"]]    retain];
	animalSound[10] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"peacock" ofType: @"mp3"]]    retain];
	animalSound[11] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"rattlesnake" ofType: @"mp3"]]retain];
	animalSound[12] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"penguin" ofType: @"mp3"]]    retain];
	animalSound[13] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Lamb" ofType: @"mp3"]]       retain];
	animalSound[14] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Duckling" ofType: @"mp3"]]   retain];
	animalSound[15] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Kid" ofType: @"mp3"]]        retain];
	animalSound[16] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Piglet" ofType: @"mp3"]]     retain];

    
    if([preferences boolForKey:@"language"]) animalLineupEnFr  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Animal_Lineup_Page_English" ofType:@"jpg"]];
    else     animalLineupEnFr  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Animal_Lineup_Page_French" ofType:@"jpg"]];

    [self.animalLineup setImage:animalLineupEnFr];

    if([preferences boolForKey:@"language"]) animalImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfAnimals objectAtIndex:0] ofType:@"png"]];
    else                                     animalImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfAnimalsFr objectAtIndex:0] ofType:@"png"]];
    animalView   = [[UIImageView alloc] initWithImage:animalImage] ;
	self.animalView.userInteractionEnabled = YES;
	self.animalView.alpha = 1.0;
	self.animalView.opaque= NO;
	self.animalView.frame = CGRectMake(0.5*heightRef-animalImage.size.width*0.5,0.5*widthRef-animalImage.size.height*0.5,animalImage.size.width,animalImage.size.height);
    
	animalDisplayed = -1; //no animal is zoomed in
    
    nullImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NULL" ofType:@"png"]];
    
    isInitialized = 1001;
    
    self.backButton.exclusiveTouch=YES;
	self.elephants.exclusiveTouch=YES;
	self.lion.exclusiveTouch=YES;
	self.bear.exclusiveTouch=YES;
	self.chimpanzee.exclusiveTouch=YES;
	self.bats.exclusiveTouch=YES;
	self.wildebeest.exclusiveTouch=YES;
	self.otters.exclusiveTouch=YES;
	self.tigers.exclusiveTouch=YES;
	self.giraffe.exclusiveTouch=YES;
	self.giraffe2.exclusiveTouch=YES;
	self.gorilla.exclusiveTouch=YES;
	self.peacock.exclusiveTouch=YES;
	self.snakes.exclusiveTouch=YES;
	self.penguin.exclusiveTouch=YES;
    self.lamb.exclusiveTouch=YES;
    self.duckling.exclusiveTouch=YES;
    self.piglet.exclusiveTouch=YES;
    self.kid.exclusiveTouch=YES;

}

- (void) changeLanguage: (BOOL) English{

    if(isInitialized == 1001){
        
        [animalLineupEnFr release];
        
	if(English){
        animalLineupEnFr  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Animal_Lineup_Page_English" ofType:@"jpg"]];
    }
    else{
        animalLineupEnFr  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Animal_Lineup_Page_French" ofType:@"jpg"]];
    }
        [self.animalLineup setImage:animalLineupEnFr];
    }
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

    [self.animalView removeFromSuperview];
    
    [player stop];
    [player release];
     player=nil;
    
    [self.caller deactivateAllButtons];
    [UIView beginAnimations:@"NavigatingMenu" context:nil];
	[UIView setAnimationDelay:0.5];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view.superview cache:NO];
	[self.view removeFromSuperview];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(cleanAnimalMenu)];
	[UIView commitAnimations];
}
-(void) cleanAnimalMenu{
    [animalLineupEnFr release];
    animalLineupEnFr=nil;
    [self.animalLineup  setImage:nullImage];
	[self.caller bannerAnimation];
	//if([preferences boolForKey:@"audio"]) [self.caller playWelcomeSound];
    [self enableAllButtons];
}

- (void) playAnimalSound: (int) playIndex{
    [player stop];
    [player release];
    player=nil;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:animalSound[playIndex] error:&error];
    player.delegate=(id)self;
    player.volume = 1.0f;
    if([player prepareToPlay])[player play];
}

- (void) enableAllButtons{
    backButton.userInteractionEnabled=YES;
	elephants.userInteractionEnabled=YES;
	lion.userInteractionEnabled=YES;
	bear.userInteractionEnabled=YES;
	chimpanzee.userInteractionEnabled=YES;
	bats.userInteractionEnabled=YES;
	wildebeest.userInteractionEnabled=YES;
	otters.userInteractionEnabled=YES;
	tigers.userInteractionEnabled=YES;
	giraffe.userInteractionEnabled=YES;
	giraffe2.userInteractionEnabled=YES;
	gorilla.userInteractionEnabled=YES;
	peacock.userInteractionEnabled=YES;
	snakes.userInteractionEnabled=YES;
	penguin.userInteractionEnabled=YES;
    lamb.userInteractionEnabled=YES;
    duckling.userInteractionEnabled=YES;
    piglet.userInteractionEnabled=YES;
    kid.userInteractionEnabled=YES;    
}

- (void) deactivateAllButtons{
    backButton.userInteractionEnabled=NO;
	elephants.userInteractionEnabled=NO;
	lion.userInteractionEnabled=NO;
	bear.userInteractionEnabled=NO;
	chimpanzee.userInteractionEnabled=NO;
	bats.userInteractionEnabled=NO;
	wildebeest.userInteractionEnabled=NO;
	otters.userInteractionEnabled=NO;
	tigers.userInteractionEnabled=NO;
	giraffe.userInteractionEnabled=NO;
	giraffe2.userInteractionEnabled=NO;
	gorilla.userInteractionEnabled=NO;
	peacock.userInteractionEnabled=NO;
	snakes.userInteractionEnabled=NO;
	penguin.userInteractionEnabled=NO;
    lamb.userInteractionEnabled=NO;
    duckling.userInteractionEnabled=NO;
    piglet.userInteractionEnabled=NO;
    kid.userInteractionEnabled=NO;
}

- (IBAction) elephantButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=0;
    [self buttonClicked];}
- (IBAction) lionButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=1;
    [self buttonClicked];}
- (IBAction) bearButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=2;
    [self buttonClicked];}
- (IBAction) chimpanzeeButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=3;
    [self buttonClicked];}
- (IBAction) batsButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=4;
    [self buttonClicked];}
- (IBAction) wildebeestButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=5;
    [self buttonClicked];}
- (IBAction) ottersButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=6;
    [self buttonClicked];}
- (IBAction) tigerButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=7;
    [self buttonClicked];}
- (IBAction) giraffeButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=8;
    [self buttonClicked];}
- (IBAction) gorillaButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=9;
    [self buttonClicked];}
- (IBAction) peacockButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=10;
    [self buttonClicked];}
- (IBAction) snakeButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=11;
    [self buttonClicked];}
- (IBAction) penguinButtonClicked: (id) sender{
    [self deactivateAllButtons];
    animalIndex=12;
    [self buttonClicked];}
- (IBAction) lambButtonClicked: (id)sender{
    [self deactivateAllButtons];
    animalIndex=13;
    [self buttonClicked];}
- (IBAction) ducklingButtonClicked: (id)sender{
    [self deactivateAllButtons];
    animalIndex=14;
    [self buttonClicked];}
- (IBAction) kidButtonClicked: (id)sender{
    [self deactivateAllButtons];
    animalIndex=15;
    [self buttonClicked];}
- (IBAction) pigletButtonClicked: (id)sender{
    [self deactivateAllButtons];
   animalIndex=16;
    [self buttonClicked];}
- (void) buttonClicked{
    [animalImage release];
    [self.animalView removeFromSuperview];
    if([preferences boolForKey:@"language"]) animalImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfAnimals objectAtIndex:animalIndex] ofType:@"png"]];
    else animalImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[listOfAnimalsFr objectAtIndex:animalIndex] ofType:@"png"]];
	[self.animalView setImage:animalImage];
    [self.view addSubview:self.animalView];
    if([preferences boolForKey:@"audio"]) [self playAnimalSound:animalIndex];
    animalDisplayed=animalIndex;
    [self enableAllButtons];
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
    UITouch *touch = [touches anyObject];
    if ([touch view] == self.animalView)
    {
        [self.animalView removeFromSuperview];
        [player stop];
        [player release];
        player=nil;
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
    
    [animalLineupEnFr release];
  	[animalImage      release];
    [listOfAnimals    release];
    [listOfAnimalsFr  release];
    [nullImage        release];
    animalLineupEnFr= nil;
    listOfAnimals   = nil;
    listOfAnimalsFr = nil;
    animalImage     = nil;
    nullImage       = nil;
    for(i=0;i<nAnimals;i++)
    {
        [animalSound[i] release];
        animalSound[i]=nil;
    }
    self.animalView = nil;
	self.elephants  = nil;
	self.lion       = nil;
	self.bear       = nil;
	self.chimpanzee = nil;
	self.bats       = nil;
	self.wildebeest = nil;
	self.otters     = nil;
	self.tigers     = nil;
	self.giraffe    = nil;
	self.giraffe2   = nil;
	self.gorilla    = nil;
	self.peacock    = nil;
	self.snakes     = nil;
	self.penguin    = nil;
	self.lamb       = nil;
    self.piglet     = nil;
    self.lamb       = nil;
    self.kid        = nil;
    self.animalLineup=nil;
    isInitialized   = 0;
    //[player release];
    //player=nil;
	[super viewDidUnload];
}


- (void)dealloc {
    [caller     release];
	[backButton release];
	[elephants  release];
    [lion       release];
	[bear       release];
	[chimpanzee release];
	[bats       release];
	[wildebeest release];
	[otters     release];
	[tigers     release];
	[giraffe    release];
	[giraffe2   release];
	[gorilla    release];
	[peacock    release];
	[snakes     release];
	[penguin    release];
    [lamb       release];
    [duckling   release];
    [piglet     release];
    [kid        release];
    [nullImage  release];
	[animalView       release];
    [animalLineup     release];
	[animalImage      release];
    [listOfAnimals    release];
    [listOfAnimalsFr  release];
    [animalLineupEnFr release];
    [player release];
    for(i=0;i<nAnimals;i++) [animalSound[i] release];
    [super dealloc];
}


@end
