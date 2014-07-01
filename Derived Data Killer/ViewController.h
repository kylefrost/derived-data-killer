//
//  ViewController.h
//  Derived Data Killer
//
//  Created by Kyle Frost on 7/1/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (strong, nonatomic) IBOutlet NSButton *deleteButton;

@property (strong, nonatomic) IBOutlet NSTextField *done;

@property (strong, nonatomic) IBOutlet NSProgressIndicator *indicator;

@end

