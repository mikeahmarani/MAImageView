//
//  MAImageView.h
//  Sample
//
//  Created by Mike Ahmarani on 12-03-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface MAImageView : NSView

- (void)setCornerRadius:(float)radius;
- (void)setBackgroundColor:(NSColor *)color;
- (void)setBorderColor:(NSColor *)color;
- (void)setBorderWidth:(float)width;
- (void)setImage:(NSImage *)image;

@end
