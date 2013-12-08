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
    
    for (int i=0; i<9; i++) {
        int x = i % 3;
        int y = i / 3;
        int type = [self.array[i] intValue];
        [self drawChess:type xCord:x yCord:y];
    }
    
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
    int space = 16;
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
    if (type == 1)
        [self drawCross:x yCord:y];
    else if(type == -1)
        [self drawCircle:x yCord:y];
}

-(void)mouseDown:(NSEvent *)theEvent
{
    NSPoint pntInWindow = [theEvent locationInWindow];
    NSPoint pntInView   = [self convertPoint:pntInWindow fromView:nil];

    int i= (int)pntInView.x / 100;
    int j= (int)pntInView.y / 100;
    NSLog(@"x=%.2f y=%.2f i=%d j=%d\n", pntInView.x, pntInView.y, i, j);
    
    int k = j*3+i;
    
    if ([self.array[k] intValue] == 0) {
        self.array[k] = [NSNumber numberWithInt:1];
        [self setNeedsDisplay:YES];
    }
}

@end
