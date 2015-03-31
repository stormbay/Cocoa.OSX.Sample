//
//  ViewController.h
//  Sample
//
//  Created by Su Xin on 15/1/24.
//  Copyright (c) 2015年 Su Xin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

- (void)setTextColor: (NSColor *)color;
- (void)setTextBgColor: (NSColor *)color;
- (void)updateLevelIndicator: (int)level;
- (void)displayScrollView;
    
@property (weak) IBOutlet NSTextField *label;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *multiLabel;
@property (weak) IBOutlet NSTextField *multiTextField;
@property (weak) IBOutlet NSPopUpButton *pop;
@property (weak) IBOutlet NSComboBox *comboBg;
@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (weak) IBOutlet NSScrollView *scrollView;
@property (weak) IBOutlet NSClipView *clipView;

@property (weak) IBOutlet NSButton *textFieldEditableState;
@property (weak) IBOutlet NSButton *textFieldEnableState;
@property (weak) IBOutlet NSButton *multiTextFieldEditableState;
@property (weak) IBOutlet NSButton *multiTextFieldEnableState;
@property (weak) IBOutlet NSMatrix *mode;
@property (weak) IBOutlet NSProgressIndicator *indicator;
@property (weak) IBOutlet NSSlider *circleSlider;
@property (weak) IBOutlet NSSlider *lineSlider;
@property (weak) IBOutlet NSLevelIndicator *levelIndicator;

- (IBAction)checkTextFieldEditable:(id)sender;
- (IBAction)checkTextFieldEnable:(id)sender;

- (IBAction)radioSelect:(id)sender;
- (IBAction)popSelect:(id)sender;
- (IBAction)comboSelect:(id)sender;

- (IBAction)circleSet:(id)sender;
- (IBAction)lineSet:(id)sender;

@end

