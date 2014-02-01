//
//  AppDelegate.h
//  Rdio Controller (Leap Motion)
//
//  Created by Kyle Banks on 1/29/2014.
//  Copyright (c) 2014 Kyle W. Banks. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StatusBarView.h"
#import "LeapMotionManager.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    StatusBarView *statusBarView;
    
    LeapMotionManager *leapMotionManager;
}

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSMenu *mainMenu;

@end
