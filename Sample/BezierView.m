//
//  BezierView.m
//  Sample
//
//  Created by Su Xin on 15/3/30.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView

- (id)initWithFrame:(NSRect)frameRect
{
	self = [super initWithFrame:frameRect];

	return self;
}

- (NSPoint)randomPoint
{
	NSPoint result;
	NSRect rect = [self bounds];
	
	result.x = rect.origin.x + random() % (int)rect.size.width;
	result.y = rect.origin.y + random() % (int)rect.size.height;

	return result;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
	NSRect bounds = [self bounds];
	[[NSColor colorWithCalibratedRed:0.8 green:0.8 blue:0.8 alpha:1.0] set];
	[NSBezierPath fillRect:bounds];


	NSPoint spt, ept;

	[[NSColor blueColor] set];
	spt = bounds.origin;
	ept.x = spt.x + bounds.size.width;
	ept.y = spt.y + bounds.size.height;
	[NSBezierPath strokeLineFromPoint:spt toPoint:ept];

	[[NSColor redColor] set];
	spt.x = bounds.origin.x;
	spt.y = bounds.origin.y + bounds.size.height;
	ept.x = bounds.origin.x + bounds.size.width;
	ept.y = bounds.origin.y;
	[NSBezierPath strokeLineFromPoint:spt toPoint:ept];

	[[NSColor greenColor] set];
	srandom((unsigned)time(NULL));
	path = [NSBezierPath bezierPath];
	[path setLineWidth:3.0];
	NSPoint pt = [self randomPoint];
	[path moveToPoint:pt];
	for (int i = 0; i < 15; i++) {
		pt = [self randomPoint];
		[path lineToPoint:pt];
	}
	[path closePath];
	[path stroke];
}

@end
