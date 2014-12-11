//
//  Confirmation.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 4/7/13.
//
//

#import <UIKit/UIKit.h>
#import "commonGamesMethods.h"

@interface Confirmation : UIViewController{
    
    NSUserDefaults *preferences;

    UIImage *frenchConfirmation;
    UIImage *englishConfirmation;
    UIImageView *frenchImage;
    UIImageView *englishImage;
        
    CGFloat widthRef ;
	CGFloat heightRef;
    
    int confirmationDisplayed;
    
    BOOL start;

    UIViewController <commonGamesMethods> *caller;
}

@property (nonatomic,retain) UIViewController <commonGamesMethods> *caller;
@property (nonatomic,assign) BOOL start;

- (void) createConfirmation;
- (void) clickConfirmation:(BOOL)exit;
- (void) exitGame;
- (void) noExitGame;
- (void) startOver;
- (void) noStartOver;
- (void) pauseAnimations;

@end
