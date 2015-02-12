//
//  SSCCompetitor.m
//  Spit Swim Club
//
//  Created by Nigel Rudgyard on 31/05/14.
//  Copyright (c) 2014 Nigel Rudgyard. All rights reserved.
//

#import "SSCCompetitor.h"

@implementation SSCCompetitor

- (id)init:(NSInteger)competitorId competitorName:(NSString*)competitorName dateOfBirth:(NSString*)dateOfBirth
{
    self = [super init];
    
    if (self)
    {
        _competitorId = competitorId;
        _competitorName = competitorName;
        _dateOfBirth = dateOfBirth;
    }
    
    return self;
}
@end
