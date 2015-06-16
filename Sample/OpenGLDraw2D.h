//
//  OpenGLDraw2D.h
//  Sample
//
//  Created by Su Xin on 15/6/16.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <GLUT/GLUT.h>

@interface OpenGLDraw2D : NSOpenGLView
{
	GLuint textureID;
	
	GLsizei videoImageWidth;
	GLsizei videoImageHeight;
	
	GLvoid *videoTexture;
}

- (void) createYUV422_UYVY_8Bit_Data;

@end
