//
//  OpenGLSample.m
//  Sample
//
//  Created by Su Xin on 15/4/1.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import "OpenGLSample.h"

@implementation OpenGLSample

- (id)initWithCoder:(NSCoder *)c
{
	self = [super initWithCoder:c];
	
	[self setSize:0.5];
	
	// The GL Context must be active before you can use OpenGL functions
	NSOpenGLContext *glcontext = [self openGLContext];
	[glcontext makeCurrentContext];
	
	//Add your OpenGL init code here
	GLfloat mat_specular []={0.9, 0.3, 0.2, 1.0};
	GLfloat mat_shininess []={50.0};
	GLfloat light_position []={2.0, 4.0, -1.0, 0.0};
	float white_light []={1.0, 1.0, 1.0, 1.0};
	GLfloat lmodel_ambient []={0.1, 0.5, 0.8, 1.0};
	glClearColor(0.0, 0.0, 0.0, 0.0);
	glShadeModel(GL_SMOOTH);
	glMaterialfv(GL_FRONT, GL_SPECULAR, mat_specular);
	glMaterialfv(GL_FRONT, GL_SHININESS, mat_shininess);
	glLightfv(GL_LIGHT0, GL_POSITION, light_position);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, white_light);
	glLightfv(GL_LIGHT0, GL_SPECULAR, white_light);
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, lmodel_ambient);
	
	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	glEnable(GL_DEPTH_TEST);
	
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	//  gluPerspective(90.0, 0.7, 0.0, 10.0);
	glRotatef(30, 0.0, 1.0, 0.0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	
	return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
	
    // Drawing code here.
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glColor3f(1.0, 0.0, 0.0);
	glutSolidTeapot([self size]);
	glutWireCube([self size]);
	
	//Signal that drawing is done - causes a buffer swap
	[[self openGLContext] flushBuffer];
}

- (void)reshape
{
	NSLog(@"reshaping %f", [self size]);
	
	//Get view dimensions
	NSRect baseRect = [self bounds];
	int w, h;
	w = baseRect.size.width;
	h = baseRect.size.height;
	
	//Add your OpenGL resize code here
	glViewport(0, 0, (GLsizei)w, (GLsizei)h);
}

@end
