//
//  BalloonYellowView.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 2/2/13.
//
//

#import "BalloonYellowView.h"

@implementation BalloonYellowView

- (void) initBalloonAnim{

    UIImage *tempImage1;
    UIImage *tempImage2;
    UIImage *tempImage3;
    UIImage *tempImage4;
    UIImage *tempImage5;
    
    tempImage1 = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_yellow_1" ofType:@"png"]];
    tempImage2 = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_yellow_2" ofType:@"png"]];
    tempImage3 = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_yellow_3" ofType:@"png"]];
    tempImage4 = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_yellow_4" ofType:@"png"]];
    tempImage5 = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_yellow_5" ofType:@"png"]];
    
	imageArray = [[NSMutableArray alloc] initWithCapacity:5];
	
	// Build array of images, cycling through image names
    [imageArray addObject:tempImage1];
	[imageArray addObject:tempImage2];
	[imageArray addObject:tempImage3];
	[imageArray addObject:tempImage4];
	[imageArray addObject:tempImage5];

    [tempImage1 release];
    [tempImage2 release];
    [tempImage3 release];
    [tempImage4 release];
    [tempImage5 release];
        
	// Animate
	self.animationImages      = imageArray;//[NSArray arrayWithArray:imageArray];
	self.animationDuration    = 0.5;
	self.animationRepeatCount = 0;
	
}

-(void) balloonAnim{
	[self startAnimating];
}

-(void) stopBalloonAnim{
    
    [self stopAnimating];
}

- (void) viewDidUnload{
    int i;
    for(i=0;i<5;i++) [imageArray[i] release];
    [imageArray release];
    imageArray=nil;
    self.animationImages=nil;
}

- (void) dealloc{
	[imageArray release];
	[super dealloc];
}


@end
