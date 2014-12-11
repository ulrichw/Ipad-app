//
//  Game4Menu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 3/11/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MainMenu.h"
#import "commonGamesMethods.h"
#import "commonMessagesMethods.h"

@class GamesMenu;

@interface Game4Menu : UIViewController <commonGamesMethods,commonMessagesMethods>{


	MainMenu *caller;
	GamesMenu *caller2;
		
	NSArray *listOfAnimals;
	NSArray *listOfImagesFr;
	NSArray *listOfImagesEn;
	
	//outlets
	UIButton    *backButton;	
	UIButton    *startOver;
	UIButton    *button1;
	UIButton    *button2;
	UIButton    *button3;
	UIButton    *button4;
	UIButton    *button5;
	UIButton    *audioButton;
	UIImageView *titleBanner;
	UIImageView *centralPicture;
	UIImageView *backgroundPicture;
	UIImageView *scoreView;
	
	int score;
	int maxScore;
	int choice[5];
	int listOfChoices[21];
	int correctButton;
	UIImage *imageAnimal;
	UIImage *imageTextFr1;
	UIImage *imageTextFr2;
	UIImage *imageTextFr3;
	UIImage *imageTextFr4;
    UIImage *imageTextEn1;
    UIImage *imageTextEn2;
    UIImage *imageTextEn3;
    UIImage *imageTextEn4;
    NSArray *imageScore;
	UIImage *imageScoreI;
	
	//USER DEFAULTS
	NSUserDefaults *preferences;

	//sound
	NSURL     *successSound;
    AVAudioPlayer  *player;
    NSError        *error;
    
    UIImageView *viewToAnimate;
    UIButton *buttonToAnimate;
    
    BOOL confirmationCalled;
	
    int isInitialized;
    
    UIImage *titleImageFrEn;
    UIImage *startOverImageFrEn;
    UIImage *nullImage;
    UIImage *BKGDImage;

}

@property (nonatomic,retain) IBOutlet UIButton *backButton;
@property (nonatomic,retain) IBOutlet UIButton *startOver;
@property (nonatomic,retain) IBOutlet UIButton *button1;
@property (nonatomic,retain) IBOutlet UIButton *button2;
@property (nonatomic,retain) IBOutlet UIButton *button3;
@property (nonatomic,retain) IBOutlet UIButton *button4;
@property (nonatomic,retain) IBOutlet UIButton *button5;
@property (nonatomic,retain) IBOutlet UIImageView *titleBanner;
@property (nonatomic,retain) IBOutlet UIImageView *centralPicture;
@property (nonatomic,retain) IBOutlet UIImageView *backgroundPicture;
@property (nonatomic,retain) IBOutlet UIImageView *scoreView;
@property (nonatomic,retain) IBOutlet UIButton *audioButton;

@property (nonatomic,retain) NSArray *listOfAnimals;
@property (nonatomic,retain) NSArray *listOfImagesFr;
@property (nonatomic,retain) NSArray *listOfImagesEn;


@property (nonatomic,retain) MainMenu  *caller  ;
@property (nonatomic,retain) GamesMenu *caller2 ;

@property (nonatomic,assign) int score;
@property (nonatomic,retain) NSURL     *successSound;
@property (nonatomic,assign) BOOL confirmationCalled;

- (IBAction) backButtonClicked;
- (IBAction) button1Clicked;
- (IBAction) button2Clicked;
- (IBAction) button3Clicked;
- (IBAction) button4Clicked;
- (IBAction) startOverClicked;
- (IBAction) buttonAudioClicked: (id) sender;
- (void) selectAnimal;
- (void) doneWithMessage;
- (void) animateView;
- (void) animateViewDone;
- (void) endAnimationButton1;
- (void) endAnimationButton2;
- (void) endAnimationButton3;
- (void) endAnimationButton4;
- (void) endAnimationButtonStartOver;
- (void) endAnimationButtonBack;
- (void) startOverCalled;
- (void) deactivateAllButtons;
- (void) changeTitleLanguage: (BOOL) inEnglish;

@end
