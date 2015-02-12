//
//  SSCViewController.m
//  Spit Swim Club
//
//  Created by Nigel Rudgyard on 17/05/14.
//  Copyright (c) 2014 Nigel Rudgyard. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define getCompetitorsURL [NSURL URLWithString:@"http://www.rudgyard.com/ssc/getJSONdata?tableName=competitor"]
#define getStrokesURL [NSURL URLWithString:@"http://www.rudgyard.com/ssc/getJSONdata?tableName=stroke"]

#import "SSCViewController.h"
#import "SSCData.h"
#import "SSCCompetitor.h"
#import "SSCStroke.h"

@interface SSCViewController ()

@end

@implementation SSCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:getCompetitorsURL];
        
        [self performSelectorOnMainThread:@selector(fetchedCompetitors:)
                               withObject:data waitUntilDone:YES];
    });
     */
    
    self.loadMessage.text = @"Loading data...";
    
    /*
     * Load data asynchronously.
     */
    dispatch_async(kBgQueue, ^{
        [[SSCData sharedSSCData] loadSSCData:self.loadMessage];
        
        [self performSelectorOnMainThread:@selector(loadComplete:)
                               withObject:nil waitUntilDone:YES];
    });
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMessageUpdate:) name:@"UpdateMessage" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) loadComplete:(NSData *) data {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UpdateMessage" object:nil];
    
    [self.activityIndicator stopAnimating];
    
    [self performSegueWithIdentifier:@"competitorSegue" sender:self];
}

- (void) handleMessageUpdate:(NSNotification *) notification {
    [self performSelectorOnMainThread:@selector(refreshMessage:) withObject:notification.object waitUntilDone:YES];
}

- (void) refreshMessage:(id) data {
    self.loadMessage.text = data;
}

/*
- (void)fetchedCompetitors:(NSData *)responseData {
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    NSArray* data = [json objectForKey:@"competitor"];
    
    SSCData *global = [SSCData sharedSSCData];
    
    for (int i = 0;  i < [data count]; i++) {
        SSCCompetitor *c = [[SSCCompetitor alloc] init];
        
        NSDictionary* row = [data objectAtIndex:i];
        
        c.competitorId = [[row objectForKey:@"competitorId"] intValue];
        c.competitorName = [row objectForKey:@"competitorName"];
        c.dateOfBirth = [row objectForKey:@"dateOfBirth"];
        
        [global.competitorArray addObject:c];
    }
    
    self.loadMessage.text = @"Loading strokes...";
    
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:getStrokesURL];
        
        [self performSelectorOnMainThread:@selector(fetchedStrokes:)
                               withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedStrokes:(NSData *)responseData {
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    NSArray* data = [json objectForKey:@"stroke"];
    
    //NSLog(@"stroke: %@", data);
    
    SSCData *global = [SSCData sharedSSCData];
    
    for (int i = 0;  i < [data count]; i++) {
        SSCStroke *s = [[SSCStroke alloc] init];
        
        NSDictionary* row = [data objectAtIndex:i];
        
        s.strokeId = [[row objectForKey:@"strokeId"] intValue];
        s.strokeName = [row objectForKey:@"strokeName"];
        
        NSLog(@"%@", s);
        
        [global.strokeArray addObject:s];
    }

   //NSLog(@"%ld rows added.", [global.strokeArray count]);
   
   //for (SSCStroke *obj in global.strokeArray) {
   //    NSLog(@"%@", obj.strokeName);
   //}
    
    [self.activityIndicator stopAnimating];
    

}*/

@end
