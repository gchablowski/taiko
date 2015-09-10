//
//  Notes.h
//  taiko
//
//  Created by gérald chablowski on 12/12/2013.
//  Copyright (c) 2013 Les marqueurs. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum TapName {
    DON,
    DO_KO,
    TSU,
    TSU_KU,
    KA,
    KA_RA,
    SU} TapName;

typedef enum TapSide {
    LEFT,
    RIGHT,
    TWO
} TapSide;


@interface Notes : NSObject <NSCopying>

@property (nonatomic,assign) TapName name;
@property (nonatomic,assign) TapSide side;
@property (nonatomic,assign) float intensity;
@property (nonatomic,assign) float duration;

- (id)initWithName:(TapName)inName andSide:(TapSide)inSide andIntensity:(float)inIntensity andDuration:(float)inDuration;

@end
