//
//  commonGamesMethods.h
//  NewParisZoo
//
//  Created by sebastien couvidat on 4/10/13.
//
//
#import <Foundation/Foundation.h>

@protocol commonGamesMethods <NSObject>

- (void) enableAllButtons;
- (void) confirmationCalled: (BOOL)isCalled withExit:(BOOL)exiting;
- (void) pauseTimers;
- (void) pauseLayers;
- (void) resumeTimers;
- (void) resumeLayers;
- (void) startOverCalled;

@end
