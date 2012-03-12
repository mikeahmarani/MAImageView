//
//  MAImageView.m
//  Sample
//
//  Created by Mike Ahmarani on 12-03-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MAImageView.h"

@interface MAImageView ()

- (CGColorRef)CGColorRefFromNSColor:(NSColor *)color;
- (void)hostLayer;

@end    

@implementation MAImageView

- (id)initWithFrame:(NSRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self hostLayer];
    }
    
    return self;
}

- (void)awakeFromNib{
    [self hostLayer];
}

- (void)hostLayer{
    if(self.layer == nil){
        NSMutableDictionary *layerActions = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                             [NSNull null], @"onOrderIn",
                                             [NSNull null], @"onOrderOut",
                                             [NSNull null], @"sublayers",
                                             [NSNull null], @"contents",
                                             [NSNull null], @"bounds",
                                             [NSNull null], @"border",
                                             [NSNull null], @"cornerRadius",
                                             [NSNull null], @"borderWidth",                                             
                                             nil];       
        
        CALayer *rootLayer = [CALayer layer];
        rootLayer.masksToBounds = YES;        
        rootLayer.frame = self.bounds;
        rootLayer.actions = layerActions;
        [self setLayer:rootLayer];
        [self setWantsLayer:YES];                
    }
}

- (CGColorRef)CGColorRefFromNSColor:(NSColor *)color{
    const NSInteger numberOfComponents = [color numberOfComponents];
    CGFloat components[numberOfComponents];
    CGColorSpaceRef colorSpace = [[color colorSpace] CGColorSpace];
    
    [color getComponents:(CGFloat *)&components];
    
    return (CGColorRef)CGColorCreate(colorSpace, components);
}

- (void)setCornerRadius:(float)radius{
    self.layer.cornerRadius = radius;
    [self.layer setNeedsDisplay];    
}

- (void)setBackgroundColor:(NSColor *)color{
    self.layer.backgroundColor = [self CGColorRefFromNSColor:color];
    [self.layer setNeedsDisplay];
}

- (void)setBorderColor:(NSColor *)color{
    self.layer.borderColor = [self CGColorRefFromNSColor:color];
    [self.layer setNeedsDisplay];    
}

- (void)setBorderWidth:(float)width{
    self.layer.borderWidth = width;
    [self.layer setNeedsDisplay];    
}

- (void)setImage:(NSImage *)image{    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = self.bounds;
    imageLayer.contents = image;
    [self.layer addSublayer:imageLayer];
}

@end
