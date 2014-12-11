//
//  Game3Menu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 2/12/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "commonGamesMethods.h"
#import "commonMessagesMethods.h"

@class MainMenu;
@class GamesMenu;
@class BalloonRedView;
@class BalloonBlueView;
@class BalloonYellowView;

@interface Game3Menu : UIViewController <commonGamesMethods,commonMessagesMethods>{

	MainMenu *caller;
	GamesMenu *caller2;

	NSArray *imageScore;
    UIImage *imageScoreI;
	
	UIImage  *imageBalloon1;
	UIImage  *imageBalloon2;
	UIImage  *imageBalloon3;

    BalloonRedView    *ballon1;
	BalloonBlueView   *ballon2;
	BalloonYellowView *ballon3;
	BalloonRedView    *ballon4;
	BalloonBlueView   *ballon5;
	BalloonYellowView *ballon6;
	UIImageView *levels;
	UIImageView *scores;
    
    UIImage *cloudImage1;
    UIImage *cloudImage2;
    UIImage *cloudImage3;
    UIImageView *cloud1;
    UIImageView *cloud2;
    UIImageView *cloud3;
    
	UIImage *titleImageFrEn;
	
	NSTimer *myTimer;    //timer for the balloons
    NSTimer *cloudTimer; //timer for the clouds
	
	//outlets
	UIButton *backButton;	
	UIButton  *audioButton;
	UIImageView *titleImage;
	UIImageView *imageBkng;

	int winningNumber;
	float timeInterval;
	
	//sounds
	NSURL          *tapSound,*successSound;
    AVAudioPlayer  *player;
    NSError        *error;

	//USER DEFAULTS
	NSUserDefaults *preferences;
	
	int level;
	int numberOfBalloonsPopped;
	int initialNumberOfBalloonsPopped;
    int numberOfBalloonsMissed;
    int numberOfFlyingBalloons;
    
    UIImageView *viewToAnimate;
    UIButton *buttonToAnimate;
    
    BOOL confirmationCalled;
    BOOL applicationResigned;
    
    NSDate *pauseStart,*previousFireDate1,*previousFireDate2;
    
    UIImage *imageLevelFrEn;
    int isInitialized;
    
    UIImage *nullImage;
    UIImage *BKGDImage;

    //for the victory animation
    UIImage *image;
    UIImageView *bravoImage;
}

@property (nonatomic,retain) BalloonRedView    *ballon1;
@property (nonatomic,retain) BalloonBlueView   *ballon2;
@property (nonatomic,retain) BalloonYellowView *ballon3;
@property (nonatomic,retain) BalloonRedView    *ballon4;
@property (nonatomic,retain) BalloonBlueView   *ballon5;
@property (nonatomic,retain) BalloonYellowView *ballon6;

@property (nonatomic,retain) IBOutlet UIButton *backButton;
@property (nonatomic,retain) IBOutlet UIImageView *titleImage;
@property (nonatomic,retain) IBOutlet UIImageView *levels;
@property (nonatomic,retain) IBOutlet UIImageView *scores;
@property (nonatomic,retain) IBOutlet UIButton *audioButton;
@property (nonatomic,retain) IBOutlet UIImageView *imageBkng;
@property (nonatomic,retain) UIImageView *cloud1;
@property (nonatomic,retain) UIImageView *cloud2;
@property (nonatomic,retain) UIImageView *cloud3;
@property (nonatomic,assign) BOOL applicationResigned;

@property (nonatomic,retain) MainMenu  *caller  ;
@property (nonatomic,retain) GamesMenu *caller2 ;
@property (nonatomic,retain) NSURL     *tapSound;
@property (nonatomic,retain) NSURL     *successSound;

@property (nonatomic,assign) int level;
@property (nonatomic,assign) BOOL confirmationCalled;

- (IBAction) backButtonClicked;
- (IBAction) buttonAudioClicked: (id) sender;
- (void) flyBalloons;
- (void) flyClouds;
- (void) countBalloonsPopped;
- (void) changeTitleLanguage: (BOOL) inEnglish;
- (void) doneWithMessage;
- (void) animateView;
- (void) animateViewDone;
- (void) endAnimationButtonBack;
- (void) startCloudTimer;
- (void) startOverCalled;
- (void) applicationWillResignActive;
- (void) victoryDone;

@end
