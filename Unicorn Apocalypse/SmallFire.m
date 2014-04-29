//
//  SmallFire.m
//  FortSiege
//
//  Created by Andrew Butcher on 4/15/11.
//  Copyright 2011 West Virginia University. All rights reserved.
//
//  This is torch sized...

#import "SmallFire.h"


@implementation SmallFire

-(id) init
{
    if ((self == [super init])) {

    }
    
    return self;
}

-(id) initWithPosition: (CGPoint) location {
    if (self == [super init]) {
        self.positionType = kCCPositionTypeGrouped;
        self.position = location;
        [self setScaleX:0.7];
        [self setScaleY:0.7];
        self.texture = [[CCTextureCache sharedTextureCache] addImage:@"fire.jpg"];
    }
    return self;
}

@end
