//
//  LeapMotionManager.h
//  Rdio Controller (Leap Motion)
//
//  Created by Kyle Banks on 1/29/2014.
//  Copyright (c) 2014 Kyle W. Banks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeapObjectiveC.h"

@interface LeapMotionManager : NSObject <LeapListener>

-(void)run;

@end
