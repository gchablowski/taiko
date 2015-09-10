//
//  Tune.h
//  taiko
//
//  Created by gérald chablowski on 12/12/2013.
//  Copyright (c) 2013 Les marqueurs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Notes;

@interface Tune : NSObject

@property (nonatomic,strong) NSMutableArray* tuneNotes;

- (NSMutableArray *)tuneNotes;
- (NSString*)tuneDescription;
- (void)addNotesToTune:(Notes*)inItem;
- (void)removeNotesFromTune:(NSUInteger)inItem;
- (float)totalTune;

@end
