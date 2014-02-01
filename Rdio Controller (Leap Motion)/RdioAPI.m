//
//  RdioAPI.m
//  Rdio Controller (Leap Motion)
//
//  Created by Kyle Banks on 1/29/2014.
//  Copyright (c) 2014 Kyle W. Banks. All rights reserved.
//

#import "RdioAPI.h"
#import <ApplicationServices/ApplicationServices.h>
#import <IOKit/hidsystem/ev_keymap.h>

@implementation RdioAPI

+ (void) play
{
    NSAppleScript *playScript = [[NSAppleScript alloc] initWithSource:@"tell application \"Rdio\" to play"];
    
    [playScript executeAndReturnError:nil];
}

+ (void) pause
{
    NSAppleScript *pauseScript = [[NSAppleScript alloc] initWithSource:@"tell application \"Rdio\" to pause"];
    
    [pauseScript executeAndReturnError:nil];
}

+ (void) togglePlaying {
    NSAppleScript *toggleScript = [[NSAppleScript alloc] initWithSource:@"tell application \"Rdio\" to playpause"];
    
    [toggleScript executeAndReturnError:nil];
}

+ (void) next
{
    NSAppleScript *nextScript = [[NSAppleScript alloc] initWithSource:@"tell application \"Rdio\" to skip to the next track"];
    
    [nextScript executeAndReturnError:nil];
}

+ (void) previous
{
    NSAppleScript *previousScript = [[NSAppleScript alloc] initWithSource:@"tell application \"Rdio\" to skip to the previous track"];
    
    [previousScript executeAndReturnError:nil];
}


+ (void) volumeUp
{
    NSAppleScript *volUpScript = [[NSAppleScript alloc] initWithSource:@"set vol to output volume of (get volume settings) \n \
                                  if vol > 90 then # 100 max \n \
                                  set volume output volume 100 \n \
                                  else \n \
                                  set volume output volume (vol + 10) \n \
                                  end if \n"];
    
    [volUpScript executeAndReturnError:nil];
}

+ (void) volumeDown
{
    NSAppleScript *volDownScript = [[NSAppleScript alloc] initWithSource:@"set vol to output volume of (get volume settings) \n \
                                  if vol < 10 then # 0 min \n \
                                  set volume output volume 0 \n \
                                  else \n \
                                  set volume output volume (vol - 10) \n \
                                  end if \n"];

    [volDownScript executeAndReturnError:nil];
}

@end
