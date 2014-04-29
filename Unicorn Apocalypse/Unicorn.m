//
//  Unicorn.m
//  Unicorn Apocalypse
//
//  Created by Andrew Butcher on 4/28/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "Unicorn.h"


@interface Unicorn ()
{
    BOOL unicornMoving;
}

@property (nonatomic, strong) CCSpriteFrameCache *cache;
@property (nonatomic, strong) CCAction *walkAction;
@property (nonatomic, strong) CCAction *moveAction;
@property (nonatomic, strong) CCSpriteBatchNode *spriteSheet;

@end

@implementation Unicorn


-(id) init
{
    if (self == [super init]) {
        // Create Unicorn sprite sheet
        self.cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [self.cache addSpriteFramesWithFile:@"unicorn.plist"];
        self.spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"unicorn.png"];
        
        // Create walk animation
        NSMutableArray *walkAnimFrames = [NSMutableArray array];
        for (int i=2; i<=6; i++) {
            [walkAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"run%d.png",i]]];
        }
        CCAnimation *walkAnim = [CCAnimation animationWithFrames:walkAnimFrames delay:0.09f];
        self.walkAction = [CCRepeatForever actionWithAction:
                           [CCAnimate actionWithAnimation:walkAnim]];
        
        // By default, run the walkAction
        [self runAction: self.walkAction];
        
        // Set initial frame
        [self setDisplayFrame: [self.cache spriteFrameByName:@"run1.png"]];
        
        // Set position
        self.position = ccp(0, 0);
    }
    return self;
}

-(id) setLocation: (CGPoint) location {
    self.position = location;
    return self;
}

-(CCAction *) getWalkAction {
    return self.walkAction;
}

@end
