//
//  TTTAppDelegate.m
//  TicTacToe
//
//  Created by Jun on 13-12-7.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "TTTAppDelegate.h"

@implementation TTTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.array = [[NSMutableArray alloc] initWithCapacity:9];
    self.board.array = self.array;
    [self restartPressed: nil];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}

- (IBAction)restartPressed:(id)sender {
    for (int i=0; i<9; i++)
        self.array[i] = [NSNumber numberWithInt:0];

    [self.board setNeedsDisplay: YES];
}
@end
