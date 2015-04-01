//
//  ViewController.m
//  Sample
//
//  Created by Su Xin on 15/1/24.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
	NSDate *date = [[NSDate alloc] init];
	
	[self.label setObjectValue: date];

	[self.multiLabel setObjectValue: date];

	[self.textField setEditable: NO];
	[self.textField setEnabled: NO];
	[self.textField setObjectValue: date];
	
	
	[self.multiTextField setEditable: NO];
	[self.multiTextField setEnabled: NO];
	[self.multiTextField setObjectValue: date];

	[self.pop addItemWithTitle: @"Clear"];
	[self.pop addItemWithTitle: @"Cyan"];
	[self.pop addItemWithTitle: @"DarkGray"];
	[self.pop addItemWithTitle: @"Gray"];
	[self.pop addItemWithTitle: @"LightGray"];
	[self.pop addItemWithTitle: @"Green"];
	[self.pop addItemWithTitle: @"Magenta"];
	[self.pop addItemWithTitle: @"Orange"];
	[self.pop addItemWithTitle: @"Purple"];
	[self.pop addItemWithTitle: @"Red"];
	[self.pop addItemWithTitle: @"White"];
	[self.pop addItemWithTitle: @"Yellow"];

	NSArray *array = [NSArray arrayWithObjects: @"Black", @"Blue", @"Brown",
					  @"Clear", @"Cyan", @"DarkGray", @"Gray", @"LightGray", @"Green",
					  @"Magenta", @"Orange", @"Purple", @"Red", @"White", @"Yellow", nil];
	[self.comboBg setEditable: NO];
	[self.comboBg addItemsWithObjectValues: array];
	[self.comboBg selectItemWithObjectValue: @"White"];
	
	[self displayScrollView];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)checkTextFieldEditable:(id)sender {
	NSInteger editable = [self.textFieldEditableState state];

	if( editable == 0 )
	{
		[self.textField setEditable: NO];
		[self.multiTextField setEditable: NO];
	}
	else
	{
		[self.textField setEditable: YES];
		[self.multiTextField setEditable: YES];
	}
}

- (IBAction)checkTextFieldEnable:(id)sender {
	NSInteger enable = [self.textFieldEnableState state];
	
	if( enable == 0 )
	{
		[self.textField setEnabled: NO];
		[self.multiTextField setEnabled: NO];
	}
	else
	{
		[self.textField setEnabled: YES];
		[self.multiTextField setEnabled: YES];
	}
}

- (void)setTextColor: (NSColor *)color
{
	[self.label setTextColor: color];
	[self.textField setTextColor: color];
	[self.multiLabel setTextColor: color];
	[self.multiTextField setTextColor: color];
}

- (void)setTextBgColor: (NSColor *)color
{
	[self.label setBackgroundColor: color];
	[self.textField setBackgroundColor: color];
	[self.multiLabel setBackgroundColor: color];
	[self.multiTextField setBackgroundColor: color];
}

- (IBAction)radioSelect:(id)sender {
	NSLog(@"row:%ld, col:%ld, tag:%ld", [self.mode selectedRow], [self.mode selectedColumn],[self.mode selectedTag]);
	
	if ([self.mode selectedTag] == 0) {
		[self setTextColor:[NSColor blackColor]];
	}
	else if ([self.mode selectedTag] == 1) {
		[self setTextColor:[NSColor redColor]];
	}
}

- (IBAction)popSelect:(id)sender {
	NSString *item = [self.pop titleOfSelectedItem];
	NSLog(@"title:%@, index:%ld, tag:%ld", item, [self.pop indexOfSelectedItem],[self.pop selectedTag]);

	if ([item isEqual: @"Black"]) {
		[self setTextColor:[NSColor blackColor]];
	}
	else if ([item isEqual: @"Blue"]) {
		[self setTextColor:[NSColor blueColor]];
	}
	else if ([item isEqual: @"Brown"]) {
		[self setTextColor:[NSColor brownColor]];
	}
	else if ([item isEqual: @"Clear"]) {
		[self setTextColor:[NSColor clearColor]];
	}
	else if ([item isEqual: @"Cyan"]) {
		[self setTextColor:[NSColor cyanColor]];
	}
	else if ([item isEqual: @"DarkGray"]) {
		[self setTextColor:[NSColor darkGrayColor]];
	}
	else if ([item isEqual: @"Gray"]) {
		[self setTextColor:[NSColor grayColor]];
	}
	else if ([item isEqual: @"LightGray"]) {
		[self setTextColor:[NSColor lightGrayColor]];
	}
	else if ([item isEqual: @"Green"]) {
		[self setTextColor:[NSColor greenColor]];
	}
	else if ([item isEqual: @"Magenta"]) {
		[self setTextColor:[NSColor magentaColor]];
	}
	else if ([item isEqual: @"Orange"]) {
		[self setTextColor:[NSColor orangeColor]];
	}
	else if ([item isEqual: @"Purple"]) {
		[self setTextColor:[NSColor purpleColor]];
	}
	else if ([item isEqual: @"Red"]) {
		[self setTextColor:[NSColor redColor]];
	}
	else if ([item isEqual: @"White"]) {
		[self setTextColor:[NSColor whiteColor]];
	}
	else if ([item isEqual: @"Yellow"]) {
		[self setTextColor:[NSColor yellowColor]];
	}
}

- (IBAction)comboSelect:(id)sender {
	NSInteger index = [self.comboBg indexOfSelectedItem];

	NSLog(@"index:%ld", index);

	if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Black"]) {
		[self setTextBgColor:[NSColor blackColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Blue"]) {
		[self setTextBgColor:[NSColor blueColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Brown"]) {
		[self setTextBgColor:[NSColor brownColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Clear"]) {
		[self setTextBgColor:[NSColor clearColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Cyan"]) {
		[self setTextBgColor:[NSColor cyanColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"DarkGray"]) {
		[self setTextBgColor:[NSColor darkGrayColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Gray"]) {
		[self setTextBgColor:[NSColor grayColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"LightGray"]) {
		[self setTextBgColor:[NSColor lightGrayColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Green"]) {
		[self setTextBgColor:[NSColor greenColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Magenta"]) {
		[self setTextBgColor:[NSColor magentaColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Orange"]) {
		[self setTextBgColor:[NSColor orangeColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Purple"]) {
		[self setTextBgColor:[NSColor purpleColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Red"]) {
		[self setTextBgColor:[NSColor redColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"White"]) {
		[self setTextBgColor:[NSColor whiteColor]];
	}
	else if ([[self.comboBg itemObjectValueAtIndex: index] isEqual: @"Yellow"]) {
		[self setTextBgColor:[NSColor yellowColor]];
	}
}

- (void)updateLevelIndicator: (int)level
{
	int current;
	double min, max;
	
	min = [self.levelIndicator minValue];
	max = [self.levelIndicator maxValue];

	current = level * (max - min) / 100 + min;
	
	[self.levelIndicator setIntegerValue: current];
}

- (IBAction)circleSet:(id)sender {
	NSLog(@"intVal: %ld", [self.circleSlider integerValue]);

	[self.indicator setIndeterminate:NO];
	[self.indicator setDoubleValue: [self.circleSlider doubleValue]];
}

- (IBAction)lineSet:(id)sender {
	NSLog(@"intVal: %ld", [self.lineSlider integerValue]);

	[self updateLevelIndicator: [self.lineSlider intValue]];
}

- (void)displayScrollView
{
	NSFileManager *file;
//	NSData *data;
	
	file = [NSFileManager defaultManager];
	NSLog(@"PWD = %@", [file currentDirectoryPath]);

//	data = [file contentsAtPath:@"../../../../android.txt"];

	[self.textView insertText: [NSString stringWithContentsOfFile:@"../../../../android.txt" encoding:NSUTF8StringEncoding error:NULL]];

	[self.textView setGrammarCheckingEnabled: NO];
	[self.textView setEditable: NO];
}

- (void)mouseDown:(NSEvent *)theEvent
{
//	NSPoint pt = [theEvent locationInWindow];
//	NSLog(@"mouse Down: %ld : %@", [theEvent clickCount], NSStringFromPoint(pt));
}

- (IBAction)glUpdate:(id)sender {
	[[self glView] setSize:[sender floatValue]];
	[[self glView] setNeedsDisplay:YES];
	
	[[self glField] setFloatValue:[sender floatValue]];
}

@end
