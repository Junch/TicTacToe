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
    NSArray *temp = @[@1, @-1, @0, @0, @0, @0, @0, @0, @1];
    self.array = [NSMutableArray arrayWithArray:temp];
    self.board.array = self.array;
    [self.board setNeedsDisplay: YES];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}

- (IBAction)restartPressed:(id)sender {
    if ([self.array[0] intValue] == 1)
        self.array[0] = [NSNumber numberWithInt:-1];
    else
        self.array[0] = [NSNumber numberWithInt:1];

    [self.board setNeedsDisplay: YES];
}
@end
