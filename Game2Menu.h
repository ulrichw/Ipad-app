//
//  Game2Menu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 2/5/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "commonGamesMethods.h"
#import "commonMessagesMethods.h"

@class MainMenu;
@class GamesMenu;

@interface Game2Menu : UIViewController <commonGamesMethods,commonMessagesMethods>{

	MainMenu  *caller;
	GamesMenu *caller2;
	NSURL     *successSound;
	NSURL     *animalSound[nAnimals];
    AVAudioPlayer  *player;
    NSError        *error;

	//outlets
	UIButton *backButton;	
	UIButton *playSound;
	UIButton *startOver;
	UIImageView *scoreView;
	UIImageView *titleImage;
	UIImageView *imageBkng;
	int score;
	int maxScore;
	int listOfChoices[21];
	
	//animal display
	UIImageView *animalView1;
	UIImageView *animalView2;
	UIImageView *animalView3;
	
	UIImage *image[3];
	NSArray *imageScore;
    UIImage *imageScoreI;
	
	NSArray *listOfAnimals;
	
	int animalSelected;
	int animalChoice;
	int choice[3];
	int x0,y0,width0,height0;
	UIImageView *viewToAnimate;
    UIButton *buttonToAnimate;
    BOOL confirmationCalled;

    NSUserDefaults *preferences;
    int isInitialized;
    
    UIImage *titleImageFrEn;
    UIImage *startOverImageFrEn;

    UIImage *nullImage;
    UIImage *BKGDImage;

}

@property (nonatomic,retain) IBOutlet UIButton    *backButton;
@property (nonatomic,retain) IBOutlet UIButton    *playSound;
@property (nonatomic,retain) IBOutlet UIImageView *titleImage;
@property (nonatomic,retain) IBOutlet UIButton    *startOver;
@property (nonatomic,retain) IBOutlet UIImageView *scoreView;
@property (nonatomic,retain) IBOutlet UIImageView *imageBkng;

@property (nonatomic,retain) MainMenu             *caller;
@property (nonatomic,retain) GamesMenu            *caller2;
@property (nonatomic,retain) NSArray              *listOfAnimals;
@property (nonatomic,retain) NSURL                *successSound;
@property (nonatomic,assign) int                   score;

@property (nonatomic,retain) UIImageView          *animalView1;
@property (nonatomic,retain) UIImageView          *animalView2;
@property (nonatomic,retain) UIImageView          *animalView3;

@property (nonatomic,assign) BOOL confirmationCalled;

- (void) createViews;

- (IBAction) backButtonClicked;
- (IBAction) playSoundClicked;
- (IBAction) startOverClicked;
- (void) stopSoundClicked;
- (void) doneWithMessage;
- (void) animateView;
- (void) animateViewDone;
- (void) animateView2;
- (void) animateView2Done;
- (void) endAnimationBackButton;
- (void) endAnimationPlaySound;
- (void) endAnimationStartOver;
- (void) startOverCalled;
- (void) deactivateAllButtons;
- (void) changeTitleLanguage: (BOOL) inEnglish;

@end
