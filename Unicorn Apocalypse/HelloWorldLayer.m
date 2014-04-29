//
//  HelloWorldLayer.m
//  Unicorn Apocalypse
//
//  Created by Andrew Butcher on 4/26/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "SmallFire.h"
#import "SmallSmoke.h"
#import "Unicorn.h"

@interface HelloWorldLayer ()
{
    BOOL unicornMoving;
}

@property (nonatomic, retain) CCSprite *unicorn;
@property (nonatomic, strong) CCSprite *background;

@end

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {

        self.background = [CCSprite spriteWithFile:@"forest background.gif"];
        self.background.scale = 0.6f;
        self.background.anchorPoint = ccp(0,0);
        [self addChild:self.background];
        
        // Set up winSize, we'll use this to place things in certain locations
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // Create a unicorn and set it's location before adding to the layer
        self.unicorn = [[Unicorn alloc] init];
        [self.unicorn setPosition:ccp(winSize.width/2, winSize.height/8)];
        [self addChild:self.unicorn];
        
        // Add some fire
        [self addChild:[[SmallFire alloc] initWithPosition:ccp(winSize.width/2, winSize.height/8)]];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
