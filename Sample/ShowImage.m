//
//  ShowImage.m
//  Sample
//
//  Created by Su Xin on 15/3/31.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import "ShowImage.h"

@implementation ShowImage

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
	[[NSColor whiteColor] set];
	[NSBezierPath fillRect: [self bounds]];

	float ratio = 0.0;
	NSSize src_size, dst_size;
	NSRect imageRect, drawRect;

	NSImage *src_image = [[NSImage alloc] initByReferencingFile:@"../../../../image.jpg"];

	src_size = [src_image size];
	dst_size = [self bounds].size;

	if (src_size.width > dst_size.width) {
		ratio = dst_size.width / src_size.width;
		dst_size.height = ratio * src_size.height;
	}

	if (src_size.height > dst_size.height) {
		dst_size.height = [self bounds].size.height;
		ratio = dst_size.height / src_size.height;
		dst_size.width = ratio * src_size.width;
	}

	imageRect.origin = NSZeroPoint;
	imageRect.size = dst_size;

	NSImage *dst_image = [[NSImage alloc] initWithSize:dst_size];

	[dst_image lockFocus];
	[src_image setSize:dst_size];
	[src_image drawAtPoint:NSZeroPoint fromRect:imageRect operation:NSCompositeCopy fraction:1.0];
	[dst_image unlockFocus];

	drawRect.origin.x = ([self bounds].size.width - imageRect.size.width) / 2;
	drawRect.origin.y = ([self bounds].size.height - imageRect.size.height) / 2;
	drawRect.size = imageRect.size;

	[dst_image drawInRect:drawRect fromRect:imageRect operation:NSCompositeSourceOver fraction:1.0];
}

@end
