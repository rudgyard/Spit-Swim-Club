//
//  SSCData.m
//  Spit Swim Club
//
//  Created by Nigel Rudgyard on 31/05/14.
//  Copyright (c) 2014 Nigel Rudgyard. All rights reserved.
//

#import "SSCData.h"
#import "SSCCompetitor.h"
#import "SSCStroke.h"

#define getCompetitorsURL [NSURL URLWithString:@"http://www.rudgyard.com/ssc/getJSONdata?tableName=competitor"]
#define getStrokesURL [NSURL URLWithString:@"http://www.rudgyard.com/ssc/getJSONdata?tableName=stroke"]

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

static SSCData *sharedInstance = nil;

@implementation SSCData

@synthesize settingsManagedObjectContext;

#pragma mark SSCData Methods

+ (SSCData *)sharedSSCData {
    static SSCData *sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[SSCData alloc] init];
        
        sharedInstance.competitorArray = [[NSMutableArray alloc] init];
        sharedInstance.strokeArray = [[NSMutableArray alloc] init];
    });
    
    return sharedInstance;
}

- (void) loadSSCData:(UILabel *) progressIndicator  {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateMessage" object:@"Loading strokes..."];
     
    sleep(2);
     
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateMessage" object:@"Loading competitors..."];
    
    sleep(2);
}

@end