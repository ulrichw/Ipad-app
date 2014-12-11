//
//  GamesMenu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 1/29/12.
//  Copyright 2012 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenu;

@interface GamesMenu : UIViewController {

	//outlets
	UIButton *buttonPuzzle;
	UIButton *buttonAnimals;
	UIButton *buttonBalloons;
	UIButton *backButton;
	UIButton *frenchEnglishButton;
	UIButton *audioButton;
	UIImageView *backgroundView;
	UIImageView *titleImage;
	
	UIImage *puzzleEnFr;
	UIImage *animalsEnFr;
	UIImage *balloonsEnFr;
	UIImage *wordmatchEnFr;
	UIImage *titleImageEnFr;
	UIImage *BKGDImage;
    
	MainMenu *caller;
	
    UIButton *buttonToAnimate;
    int isInitialized;
    UIImage *nullImage;

	//USER DEFAULTS
	NSUserDefaults *preferences;
	
}

@property (nonatomic,retain) IBOutlet UIButton *buttonPuzzle;
@property (nonatomic,retain) IBOutlet UIButton *buttonAnimals;
@property (nonatomic,retain) IBOutlet UIButton *backButton;
@property (nonatomic,retain) IBOutlet UIButton *buttonBalloons;
@property (nonatomic,retain) IBOutlet UIButton *frenchEnglishButton;
@property (nonatomic,retain) IBOutlet UIButton *audioButton;
@property (nonatomic,retain) IBOutlet UIImageView *backgroundView;
@property (nonatomic,retain) IBOutlet UIImageView *titleImage;
@property (nonatomic,retain) MainMenu *caller;

-(IBAction) buttonPuzzleClicked;
-(IBAction) buttonAnimalsClicked;
-(IBAction) buttonBalloonsClicked;
-(IBAction) frenchEnglishButtonClicked;
-(IBAction) backButtonClicked;
-(IBAction) buttonAudioClicked: (id) sender;
-(void)     changeLanguage: (BOOL) englishLanguage;
-(void)     animateView;
-(void)     animateViewDone;
-(void)     endAnimationButtonPuzzle;
-(void)     endAnimationFrenchEnglishButton;
-(void)     endAnimationButtonAnimals;
-(void)     endAnimationButtonBallons;
-(void)     enableAllButtons;
-(void)     endAnimationBackButton;
-(void)     deactivateAllButtons;


@end
