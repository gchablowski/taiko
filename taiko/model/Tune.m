//
//  Tune.m
//  taiko
//
//  Created by gérald chablowski on 12/12/2013.
//  Copyright (c) 2013 Les marqueurs. All rights reserved.
//

#import "Tune.h"

@implementation Tune

@synthesize tuneNotes;

- (NSMutableArray *)tuneNotes{
    if (!tuneNotes) {
        tuneNotes = [NSMutableArray new];
    }
    
    return tuneNotes;
}

- (NSString*)tuneDescription {
   /* NSMutableString* orderDescription = [NSMutableString new];
    
    NSArray* keys = [[[self orderItems] allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        IODItem* item1 = (IODItem*)obj1;
        IODItem* item2 = (IODItem*)obj2;
        
        return [[item1 name] compare:[item2 name]];
    }];
    
    [keys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        IODItem* item = (IODItem*)obj;
        NSNumber* quantity = (NSNumber*)[[self orderItems] objectForKey:item];
        
        [orderDescription appendFormat:@"%@ x%@\n",[item name],quantity];
    }];
    
    return [orderDescription copy];*/
    NSString *bob = @"bob";
    return bob;
}

- (void)addNotesToTune:(Notes *)inItem {
   /* IODItem* key = [self findKeyForOrderItem:inItem];
    
    if (!key) {
        [[self orderItems] setObject:[NSNumber numberWithInt:1] forKey:inItem];
    }
    else {
        NSNumber* quantity = [[self orderItems] objectForKey:key];
        int intQuantity = [quantity intValue];
        intQuantity++;
        
        [[self orderItems] removeObjectForKey:key];
        [[self orderItems] setObject:[NSNumber numberWithInt:intQuantity] forKey:key];
    }
    */
    [[self tuneNotes] addObject:inItem];
    
    }

- (void)removeNotesFromTune:(NSUInteger)inItem{
   /* IODItem* key = [self findKeyForOrderItem:inItem];
    
    if (key) {
        NSNumber* quantity = [[self orderItems] objectForKey:key];
        int intQuantity = [quantity intValue];
        intQuantity--;
        
        [[self orderItems] removeObjectForKey:key];
        
        if (intQuantity > 0)
            [[self orderItems] setObject:[NSNumber numberWithInt:intQuantity] forKey:key];
    }*/
    [[self tuneNotes] removeObjectAtIndex:inItem];
}

- (float)totalTune {
   /* __block float total = 0.0;
    float (^itemTotal)(float,int) = ^float(float price, int quantity) {
        return price * quantity;
    };
    
    [[self orderItems] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        IODItem* item = (IODItem*)key;
        NSNumber* quantity = (NSNumber*)obj;
        int intQuantity = [quantity intValue];
        
        total += itemTotal([item price],intQuantity);
    }];*/
    
    return 0;
}

@end
