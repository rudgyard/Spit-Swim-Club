//
//  SSCData.h
//  Spit Swim Club
//
//  Created by Nigel Rudgyard on 31/05/14.
//  Copyright (c) 2014 Nigel Rudgyard. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SSCSettings.h"

@interface SSCData : NSObject

@property (nonatomic, retain) NSManagedObjectContext *settingsManagedObjectContext;
@property (nonatomic, retain) NSMutableArray *competitorArray;
@property (nonatomic, retain) NSMutableArray *strokeArray;

+ (SSCData *) sharedSSCData;

- (void) loadSSCData:(UIView *) view;

@end
