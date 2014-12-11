//
//  ChimpView.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 9/29/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChimpView : UIImageView {
	float angle;	
	CGAffineTransform cgCTM;
}

- (void) chimpAnim;

@end
