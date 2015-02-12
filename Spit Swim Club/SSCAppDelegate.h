//
//  SSCAppDelegate.h
//  Spit Swim Club
//
//  Created by Nigel Rudgyard on 17/05/14.
//  Copyright (c) 2014 Nigel Rudgyard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
