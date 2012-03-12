//
//  AppDelegate.m
//  Sample
//
//  Created by Mike Ahmarani on 12-03-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window, imageView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{    
    [self.imageView setBorderColor:[NSColor blackColor]];
    [self.imageView setBorderWidth:2];
    [self.imageView setCornerRadius:10];
    [self.imageView setImage:[NSImage imageNamed:@"Image.png"]];    
}

@end
