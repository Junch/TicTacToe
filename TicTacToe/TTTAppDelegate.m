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
    
    [self addObserver:self forKeyPath:@"array"
              options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
              context:nil];
    
    [self restartPressed: nil];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}

- (IBAction)restartPressed:(id)sender {
    [self willChangeValueForKey:@"array"];
    for (int i=0; i<9; i++)
        self.array[i] = [NSNumber numberWithInt:0];
    [self didChangeValueForKey:@"array"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    NSLog(@"%@",keyPath);
    NSLog(@"%@",change);

   [self.board setNeedsDisplay: YES];
    
   //TODO: AI take actions now
    
   [self.board setNeedsDisplay: YES];
}

@end
