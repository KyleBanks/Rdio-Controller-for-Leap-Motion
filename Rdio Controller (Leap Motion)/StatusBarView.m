//
//  StatusBarView.m
//  Rdio Controller (Leap Motion)
//
//  Created by Kyle Banks on 1/29/2014.
//  Copyright (c) 2014 Kyle W. Banks. All rights reserved.
//

#import "StatusBarView.h"
#import "AppDelegate.h"

@implementation StatusBarView


-(id)initWithMenu:(NSMenu *)theMenu
{
    if(self = [super init]) {
        menu = theMenu;
        [self initializeView];
    }
    return self;
}

-(void)initializeView
{
    NSLog(@"Intializing StatusBarView...");
    
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    [statusItem setHighlightMode:YES];
    [statusItem setImage:[NSImage imageNamed:@"rdio_icon.png"]];
    [statusItem setMenu:menu];
}

@end
