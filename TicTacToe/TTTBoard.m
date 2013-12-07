//
//  TTTBoard.m
//  TicTacToe
//
//  Created by Jun on 13-12-7.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "TTTBoard.h"

@implementation TTTBoard

-(void)drawRect:(NSRect)dirtyRect
{
    [NSGraphicsContext saveGraphicsState];
    
    // Draw the border
    NSRect bRect = CGRectInset([self bounds], 2, 2);
    NSBezierPath *border= [NSBezierPath bezierPathWithRect:bRect];
    [[NSColor brownColor] set];
    [border fill];
    
    [border setLineWidth:4];
    [[NSColor blackColor] set];
    [border stroke];
    
    // Draw the inner lines
    NSBezierPath* feature = [NSBezierPath bezierPath];
    [feature moveToPoint:NSMakePoint(0, 100)];
    [feature lineToPoint:NSMakePoint(300, 100)];
    [feature moveToPoint:NSMakePoint(0, 200)];
    [feature lineToPoint:NSMakePoint(300, 200)];
    [feature moveToPoint:NSMakePoint(100, 0)];
    [feature lineToPoint:NSMakePoint(100, 300)];
    [feature moveToPoint:NSMakePoint(200, 0)];
    [feature lineToPoint:NSMakePoint(200, 300)];
    [feature setLineWidth: 4];
    [feature stroke];
    
    [NSGraphicsContext restoreGraphicsState];
}

@end
