//
//  RdioAPI.h
//  Rdio Controller (Leap Motion)
//
//  Created by Kyle Banks on 1/29/2014.
//  Copyright (c) 2014 Kyle W. Banks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RdioAPI : NSObject


+(void)pause;
+(void)play;
+(void)togglePlaying;

+(void)next;
+(void)previous;

+(void)volumeUp;
+(void)volumeDown;

@end
