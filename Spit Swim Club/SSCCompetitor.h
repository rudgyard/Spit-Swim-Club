//
//  SSCCompetitor.h
//  Spit Swim Club
//
//  Created by Nigel Rudgyard on 31/05/14.
//  Copyright (c) 2014 Nigel Rudgyard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSCCompetitor : NSObject

@property NSInteger competitorId;
@property NSString *competitorName;
@property NSString *dateOfBirth;

- (id)init:(NSInteger)competitorId competitorName:(NSString*)competitorName dateOfBirth:(NSString*)dateOfBirth;

@end
