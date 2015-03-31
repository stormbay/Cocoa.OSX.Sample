//
//  DrawCircle.m
//  Sample
//
//  Created by Su Xin on 15/3/30.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import "DrawCircle.h"

@implementation DrawCircle

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
	NSRect bounds = [self bounds];
	
	[[NSColor whiteColor] set];
	[NSBezierPath fillRect:bounds];
}

- (void)clearBg
{
	NSRect bounds = [self bounds];
	
	[self setNeedsDisplayInRect:bounds];
}

- (void)drawCircle
{
	int i = 0, count = 360;
	float angle = 0.0, step = M_PI * 2 / count;
	NSPoint nextpt;
	
	path = [NSBezierPath bezierPath];
	[path setLineWidth: 1.0];
	
	[[NSColor greenColor] set];
	[path moveToPoint:center];
	for ( i = 0; i <= count; i++) {
		angle = step * i;
		nextpt.x = center.x + radius * sinf(angle);
		nextpt.y = center.y + radius * cosf(angle);
		[path lineToPoint:nextpt];
//		NSLog(@"lineToPoint: %@", NSStringFromPoint(nextpt));
	}
//	[path closePath];
	
	[path stroke];
//	[path fill];
	
	[self displayIfNeeded];
}

- (void)mouseDown:(NSEvent *)theEvent
{
	NSPoint pt = [theEvent locationInWindow];
//	NSLog(@"mouse Down: %ld : %@", [theEvent clickCount], NSStringFromPoint(pt));
	
//	NSRect frame = [self frame];
//	NSLog(@"frame: %@", NSStringFromPoint(frame.origin));

	NSRect rect = [self bounds];
//	NSLog(@"bounds: %@", NSStringFromPoint(rect.origin));
	
	center = pt;

	float min_x = MIN((pt.x - 260), (258 + rect.size.width - pt.x));
	float min_y = MIN((pt.y - 22), (20 + rect.size.height - pt.y));
//	float min_x = MIN((pt.x - frame.origin.x), (frame.origin.x + rect.size.width - pt.x));
//	float min_y = MIN((pt.y - frame.origin.y), (frame.origin.y + rect.size.height - pt.y));
	
	radius = MIN( min_x, min_y );
	
//	NSLog(@"radius: %f", radius );
}

- (void)mouseUp:(NSEvent *)theEvent
{
//	NSPoint pt = [theEvent locationInWindow];
//	NSLog(@"mouse Up: %@", NSStringFromPoint(pt));
	
	[self drawCircle];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
//	NSPoint pt = [theEvent locationInWindow];
//	NSLog(@"mouse Dragged: %@", NSStringFromPoint(pt));
}

- (void)rightMouseDown:(NSEvent *)theEvent
{
//	NSPoint pt = [theEvent locationInWindow];
//	NSLog(@"Right mouse Down: %ld : %@", [theEvent clickCount], NSStringFromPoint(pt));
	
	[self clearBg];
}

- (void)rightMouseUp:(NSEvent *)theEvent
{
//	NSPoint pt = [theEvent locationInWindow];
//	NSLog(@"Right mouse Up: %@", NSStringFromPoint(pt));
}

- (void)rightMouseDragged:(NSEvent *)theEvent
{
//	NSPoint pt = [theEvent locationInWindow];
//	NSLog(@"Right mouse Dragged: %@", NSStringFromPoint(pt));
}

@end
