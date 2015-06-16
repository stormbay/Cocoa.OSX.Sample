//
//  OpenGLDraw2D.m
//  Sample
//
//  Created by Su Xin on 15/6/16.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import "OpenGLDraw2D.h"

@implementation OpenGLDraw2D

- (void)createYUV422_UYVY_8Bit_Data
{
	GLsizei linelen = 0;
	int i = 0, j = 0;
	int step_y = 0, step_uv = 0;
	int startline[4] = { 0 }, linecount[4] = { 0 };
	unsigned char *pdata = videoTexture;
	unsigned char val_y = 0, val_u = 0, val_v = 0;
	
	NSLog(@"w:%d, h:%d", videoImageWidth, videoImageHeight);
	
	startline[0] = 0;
	linecount[0] = videoImageHeight >> 2;
	startline[1] = linecount[0];
	linecount[1] = (videoImageHeight >> 1) - linecount[0];
	startline[2] = linecount[0] + linecount[1];
	linecount[2] = videoImageHeight >> 2;
	startline[3] = linecount[0] + linecount[1] + linecount[2];
	linecount[3] = videoImageHeight - startline[3];

	step_y  = (videoImageWidth + 255) / 256;
	step_uv = step_y * 2;

	linelen = ( videoImageWidth * 2 );
	
	// 1
	val_y = 0;
	val_u = 0x80;
	val_v = 0x80;
	for( i = 0; i < videoImageWidth; i++ )
	{
		pdata[(i<<1)]   = val_y;
		pdata[(i<<1)+1] = val_u;
		if( i % step_y == 0 )
			val_y++;
	}
	for( j = startline[0] + 1; j < startline[1]; j++ )
	{
		memcpy(( pdata + linelen * j ), pdata, linelen );
	}
	// 2
	val_y = 0;
	val_u = 0x80;
	val_v = 0x80;
	for( i = 0; i < videoImageWidth; i++ )
	{
		pdata[(linelen * startline[1] + (i<<1))] = val_y;
		if( i % 2 )
			pdata[(linelen * startline[1] + (i<<1))+1] = val_v;
		else
			pdata[(linelen * startline[1] + (i<<1))+1] = val_u;
		if( i % step_y == 0 )
			val_y++;
		if( i % step_uv == 0 )
		{
			val_u--;
			val_v++;
		}
	}
	for( j = startline[1] + 1; j < startline[2]; j++ )
	{
		memcpy(( pdata + linelen * j ), ( pdata + linelen * startline[1] ), linelen );
	}
	// 3
	val_y = 0;
	val_u = 0x80;
	val_v = 0x80;
	for( i = 0; i < videoImageWidth; i++ )
	{
		pdata[(linelen * startline[2] + (i<<1))] = val_y;
		if( i % 2 )
			pdata[(linelen * startline[2] + (i<<1))+1] = val_v;
		else
			pdata[(linelen * startline[2] + (i<<1))+1] = val_u;
		if( i % step_y == 0 )
			val_y++;
		if( i % step_uv == 0 )
		{
			val_u--;
			val_v--;
		}
	}
	for( j = startline[2] + 1; j < startline[3]; j++ )
	{
		memcpy(( pdata + linelen * j ), ( pdata + linelen * startline[2] ), linelen );
	}
	// 4
	val_y = 0;
	val_u = 0x80;
	val_v = 0x80;
	for( i = 0; i < videoImageWidth; i++ )
	{
		pdata[(linelen * startline[3] + (i<<1))] = val_y;
		if( i % 2 )
			pdata[(linelen * startline[3] + (i<<1))+1] = val_v;
		else
			pdata[(linelen * startline[3] + (i<<1))+1] = val_u;
		if( i % step_y == 0 )
			val_y++;
		if( i % step_uv == 0 )
		{
			val_u++;
			val_v--;
		}
	}
	for( j = startline[3] + 1; j < videoImageHeight; j++ )
	{
		memcpy(( pdata + linelen * j ), ( pdata + linelen * startline[3] ), linelen );
	}
}

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];
	
	// Drawing code here.
	
	[self createYUV422_UYVY_8Bit_Data];
	
	
	glTexSubImage2D (GL_TEXTURE_RECTANGLE_EXT, 0, 0, 0, videoImageWidth, videoImageHeight, GL_YCBCR_422_APPLE, GL_UNSIGNED_SHORT_8_8_REV_APPLE, videoTexture);
	
	glMatrixMode(GL_TEXTURE);
	glLoadIdentity();
	
	glBegin(GL_QUADS);
	glTexCoord2f(0.0f, 0.0f);
	glVertex2f(0.0f, videoImageHeight);
	
	glTexCoord2f(0.0f, videoImageHeight);
	glVertex2f(0.0f, 0.0f);
	
	glTexCoord2f(videoImageWidth, videoImageHeight);
	glVertex2f(videoImageWidth, 0.0f);
	
	glTexCoord2f(videoImageWidth, 0.0f);
	glVertex2f(videoImageWidth, videoImageHeight);
	glEnd();
	
	
	glFlush();
}

- (void) clearGLContext
{
	free( videoTexture );
}

- (void) prepareOpenGL
{
	glClearColor(0.0f, 0.0f, 1.0f, 1.0f);
	
	NSRect bound = [self bounds];
	
	videoImageWidth =  bound.size.width;
	videoImageHeight = bound.size.height;
	
	videoTexture = malloc(( videoImageWidth * videoImageHeight * 2 ));
	
	glGenTextures(1, &textureID);
	
	glEnable(GL_TEXTURE_RECTANGLE_EXT);
	glBindTexture(GL_TEXTURE_RECTANGLE_EXT, textureID);
	
	glTextureRangeAPPLE(GL_TEXTURE_RECTANGLE_EXT, videoImageWidth * videoImageHeight * 2, videoTexture);
	glTexParameteri(GL_TEXTURE_RECTANGLE_EXT, GL_TEXTURE_STORAGE_HINT_APPLE , GL_STORAGE_SHARED_APPLE);
	glPixelStorei(GL_UNPACK_CLIENT_STORAGE_APPLE, GL_TRUE);
	
	glTexParameteri(GL_TEXTURE_RECTANGLE_EXT, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_RECTANGLE_EXT, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_RECTANGLE_EXT, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(GL_TEXTURE_RECTANGLE_EXT, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
	glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
	
	glTexImage2D(GL_TEXTURE_RECTANGLE_EXT, 0, GL_RGBA, videoImageWidth,	videoImageHeight, 0,GL_YCBCR_422_APPLE, GL_UNSIGNED_SHORT_8_8_REV_APPLE, videoTexture);
	
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glEnable(GL_TEXTURE_2D);
	
	glViewport(0, 0, [self frame].size.width, [self frame].size.height);
	
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	NSRect bounds = NSRectFromCGRect([self bounds]);
	glOrtho( (GLfloat)NSMinX(bounds), (GLfloat)NSMaxX(bounds), (GLfloat)NSMinY(bounds), (GLfloat)NSMaxY(bounds), -1.0, 1.0);
	
	glBindTexture(GL_TEXTURE_RECTANGLE_EXT, textureID);
	glTexSubImage2D (GL_TEXTURE_RECTANGLE_EXT, 0, 0, 0, videoImageWidth, videoImageHeight, GL_YCBCR_422_APPLE, GL_UNSIGNED_SHORT_8_8_REV_APPLE, videoTexture);
	
	glMatrixMode(GL_TEXTURE);
	glLoadIdentity();
	
	glBegin(GL_QUADS);
	glTexCoord2f(0.0f, 0.0f);
	glVertex2f(0.0f, videoImageHeight);
	
	glTexCoord2f(0.0f, videoImageHeight);
	glVertex2f(0.0f, 0.0f);
	
	glTexCoord2f(videoImageWidth, videoImageHeight);
	glVertex2f(videoImageWidth, 0.0f);
	
	glTexCoord2f(videoImageWidth, 0.0f);
	glVertex2f(videoImageWidth, videoImageHeight);
	glEnd();
}

- (void) reshape
{
	NSRect rect = [self bounds];
	
	glViewport( 0, 0, rect.size.width, rect.size.height );
}

@end
