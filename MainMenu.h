//
//  MainMenu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

#define nAnimals 17

@class CastMenu   ;
@class CreditsMenu;
@class AnimalMenu ;
@class BookPage   ;
@class ChimpView  ;
@class PenguinView;
@class BatView    ;
@class BalloonView;
@class PuzzleMenu ;
@class GamesMenu  ;
@class Game2Menu  ;
@class Game3Menu  ;
@class Game4Menu  ;
@class Messages   ;
@class Messages2  ;
@class Confirmation;

@interface MainMenu : UIViewController {
	
	//DECLARATION OF OUTLETS
	UIButton *buttonCast   ;
	UIButton *buttonStart  ;
	UIButton *buttonOptions;
	UIButton *buttonCredits;
	UIButton *buttonAnimals;
	UIButton *buttonPuzzle ;
	UIButton *audioControl ;
	UIImageView *imageView ;
	
	//DECLARATION OF SUBVIEWS
	UIImageView *bannerTheNew;
	UIImageView *bannerParis ;
	UIImageView *bannerZoo   ;
	ChimpView   *chimp       ;
	PenguinView *penguin     ;
	BatView     *bat         ;
	BalloonView *balloon     ;
	
	//DECLARATION OF OTHER SCREENS
	CastMenu    *castMenu    ;
	CreditsMenu *creditsMenu ;
	AnimalMenu  *animalMenu  ;
	BookPage    *bookPage    ;
	PuzzleMenu  *puzzleMenu  ;
	GamesMenu   *gamesMenu   ;
	Game2Menu   *game2Menu   ;
	Game3Menu   *game3Menu   ;
	Game4Menu   *game4Menu   ;
	Messages    *messages    ; //positive messages
	Messages2   *messages2   ; //negative messages
    Confirmation *confirmation;//confirmation alerts before exiting a game
 	
	//DECLARATION OF IMAGES
	UIImage  *imageTitleTheNew;
	UIImage  *imageTitleParis ;
	UIImage  *imageTitleZoo   ;
	UIImage  *imageChimp      ;
	UIImage  *imagePenguin    ;
	UIImage  *imageBat        ;
	UIImage  *imageBalloon    ;
	UIImage  *imageAudioOn    ;
	UIImage  *imageAudioOff   ;
	UIImage  *imageFrancais   ;
	UIImage  *imageEnglish    ;
	UIImage  *imageButtonCast   ;
	UIImage  *imageButtonStart  ;
	UIImage  *imageButtonCredits;
	UIImage  *imageButtonAnimals;
	UIImage  *imageButtonPuzzle ;

	CAKeyframeAnimation *buttonAnimation;
	
	//SOUNDS
	NSURL          *soundFileURLRef ;
	NSURL          *soundTitleURL   ;
	NSURL          *soundTitleURLFr ;
    AVAudioPlayer  *player          ;
    NSError        *error           ;

	//USER DEFAULTS
	NSUserDefaults *preferences;
	
	CGFloat widthRef ;
	CGFloat heightRef;
	
	//FRAMES FOR CHIMPANZEE
	CGRect frameChimp;
	CGRect frameChimpFr;
    
    UIButton *buttonToAnimate;
}

@property (nonatomic,retain) IBOutlet UIButton    *buttonCast   ;
@property (nonatomic,retain) IBOutlet UIButton    *buttonStart  ;
@property (nonatomic,retain) IBOutlet UIButton    *buttonOptions;
@property (nonatomic,retain) IBOutlet UIButton    *buttonCredits;
@property (nonatomic,retain) IBOutlet UIButton    *buttonAnimals;
@property (nonatomic,retain) IBOutlet UIButton    *buttonPuzzle ;
@property (nonatomic,retain) IBOutlet UIImageView *imageView    ;
@property (nonatomic,retain) IBOutlet UIButton    *audioControl ;

@property (nonatomic,retain) UIImageView *bannerTheNew;
@property (nonatomic,retain) UIImageView *bannerParis ;
@property (nonatomic,retain) UIImageView *bannerZoo   ;
@property (nonatomic,retain) ChimpView   *chimp       ;
@property (nonatomic,retain) PenguinView *penguin     ;
@property (nonatomic,retain) BatView     *bat         ;
@property (nonatomic,retain) BalloonView *balloon     ;

@property (nonatomic,retain) CastMenu    *castMenu    ;
@property (nonatomic,retain) CreditsMenu *creditsMenu ;
@property (nonatomic,retain) AnimalMenu  *animalMenu  ;
@property (nonatomic,retain) BookPage    *bookPage    ;
@property (nonatomic,retain) PuzzleMenu  *puzzleMenu  ;
@property (nonatomic,retain) GamesMenu   *gamesMenu   ;
@property (nonatomic,retain) Game2Menu   *game2Menu   ;
@property (nonatomic,retain) Game3Menu   *game3Menu   ;
@property (nonatomic,retain) Game4Menu   *game4Menu   ;
@property (nonatomic,retain) Messages    *messages    ;
@property (nonatomic,retain) Messages2   *messages2   ;
@property (nonatomic,retain) Confirmation *confirmation;

@property (nonatomic,retain) UIImage     *imageAudioOn;
@property (nonatomic,retain) UIImage     *imageAudioOff;

@property (nonatomic,retain) CAKeyframeAnimation *buttonAnimation;

-(IBAction) buttonCastClicked:    (id) sender;
-(IBAction) buttonStartClicked:   (id) sender;
-(IBAction) buttonOptionsClicked: (id) sender;
-(IBAction) buttonCreditsClicked: (id) sender;
-(IBAction) buttonAnimalsClicked: (id) sender;
-(IBAction) buttonPuzzleClicked:  (id) sender;
-(IBAction) buttonAudioClicked:   (id) sender;

-(void)     bannerAnimation;
-(void)     buttonAnimate: (UIButton *)button;
-(void)     buttonsWillAppear: (BOOL) animated;
-(void)     bookAnimDone;
-(void)     playWelcomeSound;
-(void)     setImageForAudioButtons;
-(void)     animateView;
-(void)     animateViewDone;
-(void)     endAnimationButtonCast;
-(void)     endAnimationButtonAnimals;
-(void)     endAnimationButtonStart;
-(void)     endAnimationButtonPuzzle;
-(void)     endAnimationButtonCredits;
-(void)     enableAllButtons;
-(void)     endAnimationButtonAudio;
-(void)     endAnimationButtonOptions;
-(void)     deactivateAllButtons;

@end
