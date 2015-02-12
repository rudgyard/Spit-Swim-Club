//
//  SSCViewController.h
//  Spit Swim Club
//
//  Created by Nigel Rudgyard on 17/05/14.
//  Copyright (c) 2014 Nigel Rudgyard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSCViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *loadMessage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UITextView *jsonSummary;

@end
