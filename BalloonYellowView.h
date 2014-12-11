//
//  BalloonYellowView.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 2/2/13.
//
//

#import <UIKit/UIKit.h>

@interface BalloonYellowView : UIImageView{
    
    NSMutableArray *imageArray;

}

-(void) initBalloonAnim;
-(void) balloonAnim;
-(void) stopBalloonAnim;

@end
