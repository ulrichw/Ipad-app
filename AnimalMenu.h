//
//  AnimalMenu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/26/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MainMenu.h"

@interface AnimalMenu : UIViewController {

	UIButton *backButton;
	UIButton *elephants;
	UIButton *lion;
	UIButton *bear;
	UIButton *chimpanzee;
	UIButton *bats;
	UIButton *wildebeest;
	UIButton *otters;
	UIButton *tigers;
	UIButton *giraffe;
	UIButton *giraffe2;
	UIButton *gorilla;
	UIButton *peacock;
	UIButton *snakes;
	UIButton *penguin;
    UIButton *lamb;
    UIButton *duckling;
    UIButton *piglet;
    UIButton *kid;
	MainMenu *caller;

	NSUserDefaults *preferences;

    UIImage *animalImage;
	UIImageView *animalView;

    UIImage *animalLineupEnFr;
    UIImageView *animalLineup;
    
	CGFloat widthRef,heightRef;
	
	NSURL          *animalSound[nAnimals];
    AVAudioPlayer  *player;
    NSError        *error;
    
    NSArray *listOfAnimals;
    NSArray *listOfAnimalsFr;
    
    UIImage *nullImage;
    
	int i,animalDisplayed,animalIndex,isInitialized;
}

@property (nonatomic,retain) IBOutlet UIButton *backButton;
@property (nonatomic,retain) IBOutlet UIButton *elephants;
@property (nonatomic,retain) IBOutlet UIButton *lion;
@property (nonatomic,retain) IBOutlet UIButton *bear;
@property (nonatomic,retain) IBOutlet UIButton *chimpanzee;
@property (nonatomic,retain) IBOutlet UIButton *bats;
@property (nonatomic,retain) IBOutlet UIButton *wildebeest;
@property (nonatomic,retain) IBOutlet UIButton *otters;
@property (nonatomic,retain) IBOutlet UIButton *tigers;
@property (nonatomic,retain) IBOutlet UIButton *giraffe;
@property (nonatomic,retain) IBOutlet UIButton *giraffe2;
@property (nonatomic,retain) IBOutlet UIButton *gorilla;
@property (nonatomic,retain) IBOutlet UIButton *peacock;
@property (nonatomic,retain) IBOutlet UIButton *snakes;
@property (nonatomic,retain) IBOutlet UIButton *penguin;
@property (nonatomic,retain) IBOutlet UIButton *lamb;
@property (nonatomic,retain) IBOutlet UIButton *duckling;
@property (nonatomic,retain) IBOutlet UIButton *piglet;
@property (nonatomic,retain) IBOutlet UIButton *kid;
@property (nonatomic,retain) IBOutlet UIImageView *animalLineup;

@property (nonatomic,retain) MainMenu *caller;
@property (nonatomic,retain) UIImageView *animalView;


- (IBAction) backButtonClicked;
- (IBAction) elephantButtonClicked:   (id) sender;
- (IBAction) lionButtonClicked:       (id) sender;
- (IBAction) bearButtonClicked:       (id) sender;
- (IBAction) chimpanzeeButtonClicked: (id) sender;
- (IBAction) batsButtonClicked:       (id) sender;
- (IBAction) wildebeestButtonClicked: (id) sender;
- (IBAction) ottersButtonClicked:     (id) sender;
- (IBAction) tigerButtonClicked:      (id) sender;
- (IBAction) giraffeButtonClicked:    (id) sender;
- (IBAction) gorillaButtonClicked:    (id) sender;
- (IBAction) peacockButtonClicked:    (id) sender;
- (IBAction) snakeButtonClicked:      (id) sender;
- (IBAction) penguinButtonClicked:    (id) sender;
- (IBAction) lambButtonClicked:       (id) sender;
- (IBAction) ducklingButtonClicked:   (id) sender;
- (IBAction) pigletButtonClicked:     (id) sender;
- (IBAction) kidButtonClicked:        (id) sender;
- (void)     playAnimalSound: (int) playIndex;
- (void)     animateView;
- (void)     animateViewDone;
- (void)     animationBackButtonDone;
- (void)     changeLanguage: (BOOL) English;
- (void)     deactivateAllButtons;
- (void)     enableAllButtons;

@end
