//
//  TTTAppDelegate.h
//  TicTacToe
//
//  Created by Jun on 13-12-7.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TTTBoard.h"

@interface TTTAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet TTTBoard *board;

@property(strong) NSMutableArray* array;

- (IBAction)restartPressed:(id)sender;
@end
