//
//  DrawCircle.h
//  Sample
//
//  Created by Su Xin on 15/3/30.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DrawCircle : NSView
{
	NSBezierPath *path;
	
	NSPoint center;
	float radius;
}

- (void)clearBg;
- (void)drawCircle;

@end
