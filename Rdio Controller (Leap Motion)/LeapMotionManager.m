//
//  LeapMotionManager.m
//  Rdio Controller (Leap Motion)
//
//  Created by Kyle Banks on 1/29/2014.
//  Copyright (c) 2014 Kyle W. Banks. All rights reserved.
//

#import "LeapMotionManager.h"
#import "RdioAPI.h"

#define TIME_BETWEEN_GESTURES 300 //time in milliseconds to wait between registering gestures
#define MIN_SWIPE_DISTANCE 0.40

@implementation LeapMotionManager
{
    LeapController *controller;
    
    BOOL isSwiping;
}

- (void)run
{
    controller = [[LeapController alloc] initWithListener:self];
    
    //Listen while other applications are in the foreground
    [controller setPolicyFlags:LEAP_POLICY_BACKGROUND_FRAMES];
    
    NSLog(@"LeapMotionManager running...");
}

- (void)onInit:(NSNotification *)notification
{
    NSLog(@"LeapMotionManager Initialized");
    
    isSwiping = NO;
}

- (void)onConnect:(NSNotification *)notification
{
    NSLog(@"LeapMotionManager Connected");
    LeapController *aController = (LeapController *)[notification object];
    [aController enableGesture:LEAP_GESTURE_TYPE_CIRCLE enable:NO];
    [aController enableGesture:LEAP_GESTURE_TYPE_KEY_TAP enable:NO];
    [aController enableGesture:LEAP_GESTURE_TYPE_SCREEN_TAP enable:NO];
    [aController enableGesture:LEAP_GESTURE_TYPE_SWIPE enable:YES];
    LeapConfig *config = [aController config];
    [config setFloat:@"Gesture.Swipe.MinLength" value:250.f];
    [config save];
}

- (void)onDisconnect:(NSNotification *)notification
{
    NSLog(@"LeapMotionManager Disconnected");
}

- (void)onExit:(NSNotification *)notification
{
    NSLog(@"LeapMotionManager Exited");
}

- (void)onFrame:(NSNotification *)notification
{
    LeapController *aController = (LeapController *)[notification object];
    
    // Get the most recent frame
    LeapFrame *frame = [aController frame:0];
    
    if(!frame.isValid) {
        NSLog(@"Invalid Frame, returning...");
        return;
    }
    
    NSArray *gestures = [frame gestures:nil];
    
    if(gestures.count > 0) {
        LeapGesture *gesture = [gestures objectAtIndex:0];
        
        switch (gesture.type) {
            case LEAP_GESTURE_TYPE_SWIPE: {
                LeapSwipeGesture *swipeGesture = (LeapSwipeGesture *)gesture;
                
                //If the gesture is at it's end, perform an action (if applicable)
                if(swipeGesture.state == LEAP_GESTURE_STATE_STOP) {
                    isSwiping = NO;
                    
                    if(swipeGesture.direction.x > MIN_SWIPE_DISTANCE) {
                        NSLog(@"Swipe Right");
                        
                        [RdioAPI next];
                    } else if(swipeGesture.direction.x < -MIN_SWIPE_DISTANCE) {
                        NSLog(@"Swipe Left");
                        
                        [RdioAPI previous];
                    } else if(swipeGesture.direction.y > MIN_SWIPE_DISTANCE) {
                        NSLog(@"Swipe Up");
                        
                        [RdioAPI volumeUp];
                    } else if(swipeGesture.direction.y < -MIN_SWIPE_DISTANCE) {
                        NSLog(@"Swipe Down");
                        
                        [RdioAPI volumeDown];
                    } else if(swipeGesture.direction.z > MIN_SWIPE_DISTANCE) {
                        NSLog(@"Swipe Inwards");
                        
                        [RdioAPI togglePlaying];
                    } else {
                        NSLog(@"Ignoring Swipe Gesture");
                    }
                } else if (!isSwiping) {
                    NSLog(@"Starting Swipe gesture...");
                    isSwiping = YES;
                }
                break;
            }
            default:
                NSLog(@"Unknown gesture type, ignoring.");
                break;
        }
    }
}

- (void)onFocusGained:(NSNotification *)notification
{
    NSLog(@"Focus Gained");
}

- (void)onFocusLost:(NSNotification *)notification
{
    NSLog(@"Focus Lost");
}


@end
