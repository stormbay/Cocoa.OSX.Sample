//
//  BezierView.h
//  Sample
//
//  Created by Su Xin on 15/3/30.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BezierView : NSView
{
	NSBezierPath *path;
}

- (NSPoint)randomPoint;

@end
