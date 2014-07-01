//
//  ViewController.m
//  Derived Data Killer
//
//  Created by Kyle Frost on 7/1/14.
//  Copyright (c) 2014 Kyle Frost. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.indicator setHidden:YES];
    [self.done setHidden:YES];
}

- (IBAction)deleteData:(id)sender
{
    [self.done setHidden:YES];
    [self.indicator setHidden:NO];
    [self.indicator startAnimation:self];
    
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/rm"];
    [task setCurrentDirectoryPath:@"~/Library/Developer/Xcode/DerivedData"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-rf", @"*", nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    
    [task waitUntilExit];
    [task terminate];

    [self performSelector:@selector(stopIndicator) withObject:nil afterDelay:1.5];
}

- (void)stopIndicator
{
    [self.indicator setHidden:YES];
    [self.indicator stopAnimation:self];
    [self.done setHidden:NO];
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];
}

@end
