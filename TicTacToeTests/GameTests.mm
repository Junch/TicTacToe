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
    game->setChess(buffer);
    XCTAssertTrue(game->over(0,1));
    
    char buffer2[] = ".oxooo...";
    game->setChess(buffer2);
    XCTAssertTrue(game->over(0,1), "The x player should fail");
    
    char buffer3[] = "x...x...x";
    game->setChess(buffer3);
    XCTAssertTrue(game->over(0,0));
    
    char buffer4[] = "..x.x.x..";
    game->setChess(buffer4);
    XCTAssertTrue(game->over(0,2));
}

- (void)testMinimax_win
{
    char buffer[]="xx..o.o..";
    game->setChess(buffer);
    int alpha = game->minimax(1, -1, -1, -INF, INF);
    XCTAssertEqual(INF, alpha);
}

- (void)testMinimax_fail
{
    char buffer[]="x..o.o..";
    game->setChess(buffer);
    int alpha = game->minimax(0, -1, -1, -INF, INF);
    XCTAssertEqual(-INF, alpha);
}

- (void)testMinimax_1
{
    char buffer[] = "x........";
    game->setChess(buffer);
    int beta= game->minimax(0, -1, -1, -INF, INF);
    XCTAssertEqual(0, beta);
}

- (void)testMinimax_2
{
    char buffer[] = "x.....o..";
    game->setChess(buffer);
    int alpha= game->minimax(1, 2, 0, -INF, INF);
    XCTAssertEqual(INF, alpha);
}

- (void)testMinimax_3
{
    char buffer[] = "x.....o..";
    game->setChess(buffer);
    int alpha= game->minimax(1, 2, 0, -INF, 0);
    XCTAssertEqual(INF, alpha);
}

- (void)testMinimax_4
{
    char buffer[] = "....x.x.o";
    game->setChess(buffer);
    int beta= game->minimax(0, 2, 0, -INF, INF);
    XCTAssertEqual(0, beta);
}

- (void)testMinimax_5
{
    char buffer[] = "...ox.x.o";
    game->setChess(buffer);
    int alpha= game->minimax(1, 1, 0, -INF, INF);
    XCTAssertEqual(INF, alpha);
}

- (void)testMinimax_6
{
    char buffer[] = "...ox.x.o";
    game->setChess(buffer);
    // beta实际上确定了返回值的一个界限
    // 如果计算alpha倒推值太大(alpha>=beta)，那么可能发生剪枝，直接就返回了
    int alpha= game->minimax(1, 1, 0, -INF, 0);
    XCTAssertEqual(0, alpha);
}

- (void)testOutput2
{
    char buffer[] = "..oxxx...";
    game->setChess(buffer);

    char buffer2[9];
    game->chess(buffer2);
    
    XCTAssertTrue(0 == strncmp(buffer, buffer2, 9));
}

- (void)testCircleResonse
{
    char buffer[] = "o.oxx.x..";
    game->setChess(buffer);
    int x, y;
    game->circleResponse(x, y);
    XCTAssertEqual(1, x);
    XCTAssertEqual(0, y);
}

- (void)testCircleResonse2
{
    char buffer[] = "ox.ox....";
    game->setChess(buffer);
    int x, y;
    game->circleResponse(x, y);
    XCTAssertEqual(0, x);
    XCTAssertEqual(2, y);
}

- (void)testCircleResonse3
{
    char buffer[] = "...x..x.o";
    game->setChess(buffer);
    int x, y;
    game->circleResponse(x, y);
    
    // AI found no matter what he will do, he will fail
    // if his opponent is not mad.
    XCTAssertEqual(-1, x);
    XCTAssertEqual(-1, y);
}

@end
