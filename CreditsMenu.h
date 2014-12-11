//
//  CreditsMenu.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/5/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenu;

@interface CreditsMenu : UIViewController {

	UIButton *backButton;
    
    UIImage *page;
    
    UIImage *popUpImages;
    UIImageView *backgroundPage;
    UIImageView *popUpImage;

    MainMenu *caller;

    UIButton *mammal;
    UIButton *species;
    UIButton *migration;
    UIButton *capable;
    UIButton *ultrasonic;
    UIButton *social;
    UIButton *habitat;
    UIButton *extinct;
    UIButton *enclosure;
    UIButton *endangered;
    UIButton *solitary;
    UIButton *omnivore;
    UIButton *domestic;
    UIButton *carnivore;
    UIButton *herbivore;
    NSArray *listOfPopup;
    NSArray *listOfPopupFr;
    
    NSUserDefaults *preferences;
    
    CGFloat widthRef,heightRef;
    
    int popUpIndex,popUpDisplayed;
    
    UIImage *nullImage;

    int isInitialized;
}

@property (nonatomic,retain) IBOutlet UIButton *backButton;
@property (nonatomic,retain) IBOutlet UIButton *mammal;
@property (nonatomic,retain) IBOutlet UIButton *species;
@property (nonatomic,retain) IBOutlet UIButton *migration;
@property (nonatomic,retain) IBOutlet UIButton *capable;
@property (nonatomic,retain) IBOutlet UIButton *ultrasonic;
@property (nonatomic,retain) IBOutlet UIButton *social;
@property (nonatomic,retain) IBOutlet UIButton *habitat;
@property (nonatomic,retain) IBOutlet UIButton *extinct;
@property (nonatomic,retain) IBOutlet UIButton *enclosure;
@property (nonatomic,retain) IBOutlet UIButton *endangered;
@property (nonatomic,retain) IBOutlet UIButton *solitary;
@property (nonatomic,retain) IBOutlet UIButton *omnivore;
@property (nonatomic,retain) IBOutlet UIButton *domestic;
@property (nonatomic,retain) IBOutlet UIButton *carnivore;
@property (nonatomic,retain) IBOutlet UIButton *herbivore;
@property (nonatomic,retain) IBOutlet UIImageView *backgroundPage;
@property (nonatomic,retain) MainMenu *caller;

- (IBAction) backButtonClicked;
- (IBAction) animalButtonClicked: (id) sender;
- (void)     animateView;
- (void)     animateViewDone;
- (void)     animationBackButtonDone;
- (void)     changeLanguage: (BOOL) English;
- (void)     deactivateAllButtons;
- (void)     enableAllButtons;

@end
