//
//  BookPage.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 10/23/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>
#import <AVFoundation/AVFoundation.h>

#define Npage 26
#define nAnimals 17

@class MainMenu;
@class BalloonBlueView;
@class BalloonRedView;
@class BalloonYellowView;

@interface BookPage : UIViewController {

	UIButton *backButton;
	UIButton *previous;
	UIButton *next;
	MainMenu *caller;
	UIImageView *imageView;
	NSArray *listOfPages;
	int currentPage,currentText;
	NSUserDefaults *preferences;

    //UIImage *images[Npage];
	UIImage *image;
    UIImage *textImageI;
    UIImage *photo;
    UIImageView *photoView;
    UIImage *theEndFrEn;
    UIImageView *theEnd;
    
	//SOUNDS
	NSURL        *soundPageURL[Npage][3];
	NSURL        *soundPageURLFr[Npage][3];
		
	//TEXTS
	UIImageView *textView;
	NSString     *textImage[Npage][3];   //Englih texts
	NSString     *textImageFr[Npage][3]; //French texts
    	
	//ANIMATIONS
	CAKeyframeAnimation *page1Animation  ;
	CABasicAnimation    *resize1Animation;
	CAAnimationGroup    *group1Animation ;
	CAKeyframeAnimation *page2Animation  ;
	CABasicAnimation    *resize2Animation;
	CAAnimationGroup    *group2Animation ;
	CAKeyframeAnimation *page3Animation  ;
	CABasicAnimation    *resize3Animation;
	CAAnimationGroup    *group3Animation ;
	CAKeyframeAnimation *page4Animation  ;
	CABasicAnimation    *resize4Animation;
	CAAnimationGroup    *group4Animation ;
	CAKeyframeAnimation *page5Animation  ;
	CABasicAnimation    *resize5Animation;
	CAAnimationGroup    *group5Animation ;
	CAKeyframeAnimation *page6Animation  ;
	CABasicAnimation    *resize6Animation;
	CAAnimationGroup    *group6Animation ;
	
	UIImage     *imageBalloon1;
	UIImage     *imageBalloon2;
	UIImage     *imageBalloon3;

	BalloonRedView    *ballon1;
	BalloonBlueView   *ballon2;
	BalloonYellowView *ballon3;
    BalloonRedView    *ballon4;
    BalloonBlueView   *ballon5;
    BalloonYellowView *ballon6;
    
	
	//CORE ANIMATION
    CALayer        *rootLayer;
	CAEmitterLayer *mortor;
    id              img;
    CAEmitterCell  *rocket;
    CAEmitterCell  *flare;
    CAEmitterCell  *firework;
    CAEmitterCell  *preSpark;
    CAEmitterCell  *spark;
    
    //AVAudioPlayer for extra functionality on some sounds
    NSURL          *animalSound[nAnimals];
    NSURL          *randomsounds[4];
    AVAudioPlayer  *player;
    AVAudioPlayer  *player2;
    NSError        *error;
    
    UIButton *buttonToAnimate;
    
    CGFloat heightRef,widthRef;
    int isInitialized;
    
    //To detect swipes
    CGPoint startPosition;
    CGAffineTransform affineTransform;
    BOOL deactivateSwipe;
}

@property (nonatomic,retain) IBOutlet UIButton    *backButton      ;
@property (nonatomic,retain) IBOutlet UIButton    *previous        ;
@property (nonatomic,retain) IBOutlet UIButton    *next            ;
@property (nonatomic,retain) IBOutlet UIImageView *imageView       ;
@property (nonatomic,retain) UIImageView          *textView        ;
@property (nonatomic,retain) MainMenu             *caller          ;
@property (nonatomic,retain) CAKeyframeAnimation  *page1Animation  ;
@property (nonatomic,retain) CABasicAnimation     *resize1Animation;
@property (nonatomic,retain) CAAnimationGroup     *group1Animation ;
@property (nonatomic,retain) CAKeyframeAnimation  *page2Animation  ;
@property (nonatomic,retain) CABasicAnimation     *resize2Animation;
@property (nonatomic,retain) CAAnimationGroup     *group2Animation ;
@property (nonatomic,retain) CAKeyframeAnimation  *page3Animation  ;
@property (nonatomic,retain) CABasicAnimation     *resize3Animation;
@property (nonatomic,retain) CAAnimationGroup     *group3Animation ;
@property (nonatomic,retain) CAKeyframeAnimation  *page4Animation  ;
@property (nonatomic,retain) CABasicAnimation     *resize4Animation;
@property (nonatomic,retain) CAAnimationGroup     *group4Animation ;
@property (nonatomic,retain) CAKeyframeAnimation  *page5Animation  ;
@property (nonatomic,retain) CABasicAnimation     *resize5Animation;
@property (nonatomic,retain) CAAnimationGroup     *group5Animation ;
@property (nonatomic,retain) CAKeyframeAnimation  *page6Animation  ;
@property (nonatomic,retain) CABasicAnimation     *resize6Animation;
@property (nonatomic,retain) CAAnimationGroup     *group6Animation ;
@property (nonatomic,retain) BalloonRedView       *ballon1         ;
@property (nonatomic,retain) BalloonBlueView      *ballon2         ;
@property (nonatomic,retain) BalloonYellowView    *ballon3         ;
@property (nonatomic,retain) BalloonRedView       *ballon4         ;
@property (nonatomic,retain) BalloonBlueView      *ballon5         ;
@property (nonatomic,retain) BalloonYellowView    *ballon6         ;
@property (nonatomic,retain) NSArray              *listOfPages     ;

- (IBAction) backButtonClicked;
- (IBAction) nextButtonClicked: (id) sender;
- (IBAction) previousButtonClicked: (id) sender;
- (void)     changeTextLanguageToEnglish: (BOOL) English;
- (void)     playPageSound: (int) playPage andText: (int) playText;
- (int)      currentPage;
- (int)      currentText;
- (void)     addSubViewText;
- (void)     page1Animated;
- (void)     page24Animated;
- (void)     page25Animated;
- (void)     fireWorksAnimation;
- (void)     animateView;
- (void)     animateViewDone;
- (void)     endAnimationPreviousButton;
- (void)     endAnimationNextButton;
- (void)     endAnimationBackButton;
- (void)     deactivateAllButtons;
- (void)     endTurningPage;

@end
