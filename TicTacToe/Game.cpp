//
//  Game.cpp
//  TicTacToe
//
//  Created by Jun on 13-12-8.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#include "Game.h"
#include <cassert>
#define SIZE 3

Game::Game():step(0)
{
    ::memset(board, '.',sizeof(board));
}

void Game::print()
{
    printf("\n");
    for (int i=0; i<SIZE; ++i){
        for (int j=0; j<SIZE; ++j) {
            printf("%c", board[i][j]);
        }
        printf("\n");
    }
}

void Game::setChess(char buffer[])
{
    step = 0;
    int i,j;
    for (int k=0; k<SIZE*SIZE; k++) {
        i=k/SIZE;
        j=k%SIZE;
        board[i][j]=buffer[k];
        if (buffer[k] == 'x' || buffer[k] == 'o')
            ++step;
    }
}

void Game::chess(char buffer[])
{
    int i,j;
    for (int k=0; k<SIZE*SIZE; k++) {
        i=k/SIZE;
        j=k%SIZE;
        buffer[k] = board[i][j];
    }
}

void Game::setChess(char c, int x, int y)
{
    assert(c=='x' || c=='o' || c=='.');
    if (c!='x' && c!='o' && c!='.')
        return;

    bool isBlank = (board[y][x] == '.');
    if ((c=='x' || c=='o') && isBlank)
        ++step;
    else if(c=='.' && !isBlank)
        --step;
    
    board[y][x]=c;
}

char Game::chess(int x, int y)
{
    return board[y][x];
}

bool Game::over(int x, int y)
{
    if (x==-1 && y==-1) // During initialization
        return false;
    
    int k=0;
    for (int i=0; i<SIZE; i++) {
        if (board[y][i] == 'x')
            ++k;
        else if(board[y][i] == 'o')
            --k;
    }
    
    if (k==SIZE || k==-SIZE)
        return true;
    
    k=0;
    for (int i=0; i<SIZE; i++) {
        if (board[i][x] == 'x')
            ++k;
        else if(board[i][x] == 'o')
            --k;
    }
    
    if (k==SIZE || k==-SIZE)
        return true;
    
    if (x==y){
        k=0;
        for (int i=0; i<SIZE; i++) {
            if (board[i][i] == 'x')
                ++k;
            else if(board[i][i] == 'o')
                --k;
        }
        
        if (k==SIZE || k==-SIZE)
            return true;
    }
    
    if (x+y==SIZE-1){
        k=0;
        for (int i=0; i<SIZE; i++) {
            if (board[i][SIZE-i-1] == 'x')
                ++k;
            else if(board[i][SIZE-i-1] == 'o')
                --k;
        }
        
        if (k==SIZE || k==-SIZE)
            return true;
    }
    
    return false;
}

int Game::minimax(int type, int x, int y, int alpha, int beta)
{
    //Check whether the game is over
    if (over(x, y)) // Game is over
        return type==1? -INF:INF;
    
    if (step == SIZE*SIZE) // No winner
        return 0;
    
    if (type) { // MAX Node
        alpha = -INF; // This line cannot be removed
        for (int i=0; i<SIZE; i++) {
            for (int j=0; j<SIZE; j++) {
                if (board[i][j] == '.') {
                    board[i][j] = 'x';
                    ++step;
                    int score = minimax(0, j, i, alpha, beta);
                    board[i][j] = '.';
                    --step;
                    
                    if (score > alpha)
                        alpha = score;
                    if (alpha >= beta)
                        return alpha;
                }
            }
        }
        
        return alpha;
    }
    else{ // MIN Node
        beta = INF; // This line cannot be removed
        for (int i=0; i<SIZE; i++) {
            for (int j=0; j<SIZE; j++) {
                if (board[i][j] == '.') {
                    board[i][j] = 'o';
                    ++step;
                    int score = minimax(1, j, i, alpha, beta);
                    board[i][j] = '.';
                    --step;
                    
                    if (score < beta)
                        beta = score;
                    if (alpha >= beta)
                        return beta;
                }
            }
        }
        return beta;
    }
}

bool Game::solve(int& x, int& y)
{
    int alpha = -INF;
    for (int i=0; i<SIZE; i++) {
        for (int j=0; j<SIZE; j++) {
            if (board[i][j] == '.') {
                board[i][j] = 'x';
                step++;
                int score = minimax(0, j, i, alpha, INF);
                board[i][j] = '.';
                step--;
                
                if (score > alpha)
                    alpha = score;
                if (alpha == INF){
                    x = j;
                    y = i;
                    return true;
                }
            }
        }
    }
    
    return false;
}

void Game::circleResponse(int& x, int& y)
{
    //Opponent may win
    int x0 = -1;
    int y0 = -1;
    bool bFirstEven = true;
    
    int beta = INF;
    for (int i=0; i<SIZE; i++) {
        for (int j=0; j<SIZE; j++) {
            if (board[i][j] == '.') {
                board[i][j] = 'o';
                step++;
                int score = minimax(1, j, i, -INF, beta);
                board[i][j] = '.';
                step--;
                
                if (score < beta)
                    beta = score;
                if (score == -INF){
                    x = j;
                    y = i;
                    return;
                }
                else if(score == 0 && bFirstEven){
                    // Need to consider the alpha-beta prune
                    // If the returned score==0, it is possible that it is a bad answer, that it has been given up.
                    // Just remember the first time the score is set to 0.
                    x0 = j;
                    y0 = i;
                    bFirstEven = false;
                }
                else if(score == INF){
                    
                }
            }
        }
    }
    
    if (x0 != -1) {
        x = x0;
        y = y0;
    }
    else // circle may fail no matter what he will do
    {
        x = -1;
        y = -1;
    }
}
