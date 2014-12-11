//
//  PuzzleMenu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 12/30/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "commonGamesMethods.h"
#import "commonMessagesMethods.h"

#define nPiecePuzzle 60

@class MainMenu;
@class GamesMenu;

@interface PuzzleMenu : UIViewController <commonGamesMethods,commonMessagesMethods>{
	
	UIImageView *puzzleElement[nPiecePuzzle];
	UIImageView *hintImageView1;
	UIImageView *hintImageView2;
	UIImageView *puzzleCompleteView;
	UIImage *puzzleImage[nPiecePuzzle];
	UIImage *hintImage[2];
	UIImage *puzzleCompleteFrEn;
	
	NSArray *listOfPieces;
	
	CGFloat centerX[nPiecePuzzle],centerY[nPiecePuzzle];
    CGFloat maxDistance;
    CGFloat widthRef ;
	CGFloat heightRef;

	int i,correctPieces;
	
	//sound
	NSURL     *successSound;
    NSURL     *applauseSound;
    AVAudioPlayer  *player;
    NSError        *error;

	MainMenu  *caller;
	GamesMenu *caller2;

	//outlets
	UIButton  *backButton;
	UIButton  *hint1Button;
	UIButton  *hint2Button;
	UIButton  *clearPuzzle;
	UIButton  *audioButton;
	UIImageView *hintView;
    UIImageView *titleImage;
	UIImageView *imageBkng;
	
	CAKeyframeAnimation *bannerAnimation;

	//USER DEFAULTS
	NSUserDefaults *preferences;

    UIButton *buttonToAnimate;
    BOOL confirmationCalled;
    
    int isInitialized;
    
    UIImage *titleImageFrEn;
    UIImage *startOverImageFrEn;
    UIImage *hintImageFrEn;
    UIImage *nullImage;
    UIImage *BKGDImage;
}

@property (nonatomic,retain) NSURL     *successSound;
@property (nonatomic,retain) NSURL     *applauseSound;
@property (nonatomic,retain) MainMenu  *caller;
@property (nonatomic,retain) GamesMenu *caller2;
@property (nonatomic,retain) IBOutlet UIButton *backButton;
@property (nonatomic,retain) IBOutlet UIImageView *imageBkng;
@property (nonatomic,retain) IBOutlet UIButton *hint1Button;
@property (nonatomic,retain) IBOutlet UIButton *hint2Button;
@property (nonatomic,retain) IBOutlet UIButton *clearPuzzle;
@property (nonatomic,retain) IBOutlet UIButton *audioButton;
@property (nonatomic,retain) IBOutlet UIImageView *hintView;
@property (nonatomic,retain) IBOutlet UIImageView *titleImage;
@property (nonatomic,retain) CAKeyframeAnimation *bannerAnimation;
@property (nonatomic,retain) NSArray *listOfPieces;
@property (nonatomic,retain) UIImageView *hintImageView1;
@property (nonatomic,retain) UIImageView *hintImageView2;
@property (nonatomic,retain) UIImageView *puzzleCompleteView;
@property (nonatomic,assign) BOOL confirmationCalled;

- (IBAction) backButtonClicked;
- (IBAction) hint1ButtonClicked: (id) sender;
- (IBAction) hint2ButtonClicked: (id) sender;
- (IBAction) clearPuzzleClicked: (id) sender;
- (IBAction) buttonAudioClicked: (id) sender;
- (void) bannerAnimate: (UIImageView *)imageView;
- (void) bannerWillAppear;
- (void) animateView;
- (void) animateViewDone;
- (void) endAnimationBackButton;
- (void) endAnimationHint1Button;
- (void) endAnimationHint2Button;
- (void) endAnimationClearPuzzle;
- (void) doneWithMessage;
- (void) startOverCalled;
- (void) deactivateAllButtons;
- (void) changeTitleLanguage: (BOOL) inEnglish;
- (void) createPieces;

@end
