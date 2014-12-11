//
//  CastMenu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenu;

@interface CastMenu : UIViewController {

	UIButton *backButton;
	UIButton *Amine;
	UIButton *Amrita;
	UIButton *Antoine;
	UIButton *Dominic;
	UIButton *Enzo;
	UIButton *Eric;
	UIButton *Gilbert;
	UIButton *Lily;
	UIButton *Mayra;
	UIButton *MsPetit;
	UIButton *Ousmane;
	UIButton *Paulette;
	UIButton *Rafa;
	UIButton *Sofia;
	UIButton *Sylvie;
	UIButton *Yasmine;
	
	MainMenu *caller;
	
    NSUserDefaults *preferences;

	UIImage *character;
    
	UIImageView *characterView;
    
    NSArray *listOfCharacters;
    NSArray *listOfCharactersFr;
    
	CGFloat widthRef,heightRef;
	
	int characterDisplayed,characterIndex;

    UIImageView *imageView;
    UIImage *characterLineup;
    
    UIImage *nullImage;
    
    int isInitialized;
}

@property (nonatomic,retain) IBOutlet UIButton *backButton  ;
@property (nonatomic,retain) IBOutlet UIImageView *imageView;
@property (nonatomic,retain) IBOutlet UIButton *Amine;
@property (nonatomic,retain) IBOutlet UIButton *Amrita;
@property (nonatomic,retain) IBOutlet UIButton *Antoine;
@property (nonatomic,retain) IBOutlet UIButton *Dominic;
@property (nonatomic,retain) IBOutlet UIButton *Enzo;
@property (nonatomic,retain) IBOutlet UIButton *Eric;
@property (nonatomic,retain) IBOutlet UIButton *Gilbert;
@property (nonatomic,retain) IBOutlet UIButton *Lily;
@property (nonatomic,retain) IBOutlet UIButton *Mayra;
@property (nonatomic,retain) IBOutlet UIButton *MsPetit;
@property (nonatomic,retain) IBOutlet UIButton *Ousmane;
@property (nonatomic,retain) IBOutlet UIButton *Paulette;
@property (nonatomic,retain) IBOutlet UIButton *Rafa;
@property (nonatomic,retain) IBOutlet UIButton *Sofia;
@property (nonatomic,retain) IBOutlet UIButton *Sylvie;
@property (nonatomic,retain) IBOutlet UIButton *Yasmine;
@property (nonatomic,retain) UIImageView *characterView;
@property (nonatomic,retain) MainMenu *caller;


- (IBAction) backButtonClicked;
- (IBAction) amineButtonClicked:   (id) sender;
- (IBAction) amritaButtonClicked:  (id) sender;
- (IBAction) antoineButtonClicked: (id) sender;
- (IBAction) dominicButtonClicked: (id) sender;
- (IBAction) enzoButtonClicked:    (id) sender;
- (IBAction) ericButtonClicked:    (id) sender;
- (IBAction) gilbertButtonClicked: (id) sender;
- (IBAction) lilyButtonClicked:    (id) sender;
- (IBAction) mayraButtonClicked:   (id) sender;
- (IBAction) mspetitButtonClicked: (id) sender;
- (IBAction) ousmaneButtonClicked: (id) sender;
- (IBAction) pauletteButtonClicked:(id) sender;
- (IBAction) rafaButtonClicked:    (id) sender;
- (IBAction) sofiaButtonClicked:   (id) sender;
- (IBAction) sylvieButtonClicked:  (id) sender;
- (IBAction) yasmineButtonClicked: (id) sender;
- (void)     animateView;
- (void)     animateViewDone;
- (void)     animationBackButtonDone;
- (void)     changeLanguage: (BOOL) English;
- (void)     deactivateAllButtons;
- (void)     enableAllButtons;
@end
