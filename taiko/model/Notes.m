//
//  Notes.m
//  taiko
//
//  Created by gérald chablowski on 12/12/2013.
//  Copyright (c) 2013 Les marqueurs. All rights reserved.
//

#import "Notes.h"

@implementation Notes 

@synthesize name;
@synthesize side;
@synthesize intensity;
@synthesize duration;


- (id)initWithName:(TapName)inName andSide:(TapSide)inSide andIntensity:(float)inIntensity andDuration:(float)inDuration{
    if (self = [self init]) {
        [self setName:inName];
        [self setSide:inSide];
        [self setIntensity: inIntensity];
        [self setDuration: inDuration];
    }
    
    return self;
}

-(id)copyWithZone:(NSZone *)zone {
    Notes* newItem = [Notes new];
    [newItem setName:[self name]];
    [newItem setSide:[self side]];
    [newItem setIntensity:[self intensity]];
    [newItem setDuration:[self duration]];
    
    return newItem;
}

@end
