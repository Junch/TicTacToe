//
//  TTTBoard.h
//  TicTacToe
//
//  Created by Jun on 13-12-7.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TTTBoard : NSView

-(void)drawRect:(NSRect)dirtyRect;

-(void)drawChess:(int)type xCord:(int)x yCord:(int)y;

@property (weak) NSMutableArray* array;

@end
