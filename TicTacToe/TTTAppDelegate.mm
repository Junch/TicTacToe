//
//  TTTAppDelegate.m
//  TicTacToe
//
//  Created by Jun on 13-12-7.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "TTTAppDelegate.h"
#include "Game.h"

@implementation TTTAppDelegate
Game* game;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    game = new Game();
    
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
    //[self willChangeValueForKey:@"array"];
    for (int i=0; i<9; i++)
        self.array[i] = [NSNumber numberWithInt:0];
    //[self didChangeValueForKey:@"array"];
    [self.board setNeedsDisplay: YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    NSLog(@"%@",keyPath);
    NSLog(@"%@",change);
    if ([keyPath isEqual: @"array"])
    {
        [self.board setNeedsDisplay: YES];

        [self outputToGame];
        int x;
        int y;
        game->circleResponse(x, y);
        if (x!=-1) {
            int k=(2-y)*3 + x;
            self.array[k] = [NSNumber numberWithInt:-1];

            [self.board setNeedsDisplay: YES];
        }
        else
            NSLog(@"Cannot find good solution!\n");
    }
}

- (void) outputToGame
{
    char buffer[9];
    
    int i,j;
    int nk;
    for (int k=0; k<9; k++) {
        i = k/3;
        j = k%3;
        int val = [self.array[k] intValue];
        
        nk = (2-i)*3+j;
        if (val == 0)
            buffer[nk] = '.';
        else if(val==1)
            buffer[nk] = 'x';
        else if(val==-1)
            buffer[nk]= 'o';
        else
            assert(!"Unknown values");
    }
    
    game->import(buffer);
}

@end
