//
//  Game.h
//  TicTacToe
//
//  Created by Jun on 13-12-8.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#ifndef __TicTacToe__Game__
#define __TicTacToe__Game__

#include <iostream>
#define INF 100000

class Game {
public:
    Game();
    void setChess(char buffer[]);
    void chess(char buffer[]);
    void setChess(char c, int x, int y);
    char chess(int x, int y);
    
    void print();
    bool over(int x, int y);
    int  minimax(int type, int x, int y, int alpha, int beta);
    bool solve(int& x, int& y);
    void circleResponse(int& x, int& y);
    
private:
    char board[3][3];
    int  step;
};

#endif /* defined(__TicTacToe__Game__) */
