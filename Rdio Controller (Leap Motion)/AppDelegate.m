//
//  AppDelegate.m
//  Rdio Controller (Leap Motion)
//
//  Created by Kyle Banks on 1/29/2014.
//  Copyright (c) 2014 Kyle W. Banks. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void) applicationWillFinishLaunching: (NSNotification *)not
{
    NSLog(@"Initializing Rdio Controller...");
    
    [NSApp setActivationPolicy:NSApplicationActivationPolicyAccessory]; //Hide dock icon
    
    statusBarView = [[StatusBarView alloc] initWithMenu:[NSApp mainMenu]];
    leapMotionManager = [[LeapMotionManager alloc] init];
    [leapMotionManager run];
}

@end
