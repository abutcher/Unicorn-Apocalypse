//
//  Unicorn.h
//  Unicorn Apocalypse
//
//  Created by Andrew Butcher on 4/28/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Unicorn : CCSprite {
}

-(id) init;
-(id) setLocation: (CGPoint) location;
-(CCAction *) getWalkAction;

@end
