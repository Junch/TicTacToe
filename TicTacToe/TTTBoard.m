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
    
    // TODO: The following lines are just to test the drawChess method
    // They will be replaced later
    [self drawChess:0 xCord:0 yCord:0];
    [self drawChess:1 xCord:2 yCord:1];
    
    [NSGraphicsContext restoreGraphicsState];
}

-(void)drawCross:(int)x yCord:(int)y
{
    int space = 20;
    int x1 = 100 * x + space;
    int y1 = 100 * y + space;
    int x2 = 100 * (x+1) - space;
    int y2 = 100 * (y+1) - space;
    
    NSBezierPath* feature = [NSBezierPath bezierPath];
    [feature moveToPoint:NSMakePoint(x1, y1)];
    [feature lineToPoint:NSMakePoint(x2, y2)];
    [feature moveToPoint:NSMakePoint(x1, y2)];
    [feature lineToPoint:NSMakePoint(x2, y1)];
    [feature setLineCapStyle: NSRoundLineJoinStyle];
    [feature setLineWidth: 6];
    [feature stroke];
}

-(void)drawCircle:(int)x yCord:(int)y
{
    int space = 18;
    int x1 = 100 * x + space;
    int y1 = 100 * y + space;
    NSRect rc;
    rc.origin = CGPointMake(x1, y1);
    rc.size = CGSizeMake(100-2*space, 100-2*space);
    
    NSBezierPath* circ = [NSBezierPath bezierPathWithOvalInRect:rc];
    [circ setLineWidth:6];
    [circ stroke];
}

-(void)drawChess:(int)type xCord:(int)x yCord:(int)y
{
    if (type)
        [self drawCross:x yCord:y];
    else
        [self drawCircle:x yCord:y];
}

@end
