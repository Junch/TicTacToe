//
//  GameTests.mm
//  TicTacToe
//
//  Created by Jun on 13-12-8.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "Game.h"

@interface GameTests : XCTestCase
@end

@implementation GameTests

Game *game;

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    game = new Game;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    delete game;
    game = NULL;
    
    [super tearDown];
}

- (void)testOver
{
    char buffer[] = "..oxxx...";
    game->init(buffer);
    XCTAssertTrue(game->over(1,0));
    
    char buffer2[] = ".oxooo...";
    game->init(buffer2);
    XCTAssertTrue(game->over(1,0), "The x player should fail");
    
    char buffer3[] = "x...x...x";
    game->init(buffer3);
    XCTAssertTrue(game->over(0,0));
    
    char buffer4[] = "..x.x.x..";
    game->init(buffer4);
    XCTAssertTrue(game->over(0,2));
}

- (void)testMinimax_win
{
    char buffer[]="xx..o.o..";
    game->init(buffer);
    int alpha = game->minimax(1, -1, -1, -INF, INF);
    XCTAssertEqual(INF, alpha);
}

- (void)testMinimax_fail
{
    char buffer[]="x..o.o..";
    game->init(buffer);
    int alpha = game->minimax(0, -1, -1, -INF, INF);
    XCTAssertEqual(-INF, alpha);
}

- (void)testInit
{
    NSArray* tmp = @[@1,@-1,@0,@0,@0,@0,@0,@0,@0];
    
    NSMutableArray* arr = [NSMutableArray arrayWithArray: tmp];
    game->init(arr);
    game->print();
}


@end
