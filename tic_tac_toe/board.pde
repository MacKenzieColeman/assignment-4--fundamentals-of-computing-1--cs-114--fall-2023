void drawBoard() {
  float cellWidth = width / 3;
  float cellHeight = height / 3;

  strokeWeight(2);
  for (int i = 1; i < 3; i++) {
    line(i * cellWidth, 0, i * cellWidth, height);
    line(0, i * cellHeight, width, i * cellHeight);
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      float x = j * cellWidth + cellWidth / 2;
      float y = i * cellHeight + cellHeight / 2;
      if (board[i][j] == 1) {
        drawCircle(x, y);
      } else if (board[i][j] == 2) {
        drawCross(x, y, cellWidth / 2);
      }
    }
  }
}

void processMove(int index) {
  int row = index / 3;
  int col = index % 3;

  if (board[row][col] == 0) {
    board[row][col] = 1;
    userTurn = false;

    if (checkWinner(1)) {
      println("Congratulations! You won!");
      gameOver = true;
    } else {
      computerMove();
      if (checkWinner(2)) {
        println("Computer wins! Better luck next time.");
        gameOver = true;
      } else if (isBoardFull()) {
        println("It's a draw! The game is over.");
        gameOver = true;
      }
    }
  } else {
    println("Invalid move! Choose an empty square.");
  }
}

void computerMove() {
  if (!gameOver) {
    int emptyCount = countEmptyCells();
    if (emptyCount > 0) {
      int index = int(random(emptyCount));
      int count = 0;

      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == 0) {
            if (count == index) {
              board[i][j] = 2;
              userTurn = true;
              return;
            }
            count++;
          }
        }
      }
    }
  }
}

int countEmptyCells() {
  int count = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 0) {
        count++;
      }
    }
  }
  return count;
}

boolean checkWinner(int player) {
  for (int i = 0; i < 3; i++) {
    if ((board[i][0] == player && board[i][1] == player && board[i][2] == player) ||
        (board[0][i] == player && board[1][i] == player && board[2][i] == player)) {
      return true;
    }
  }

  if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
      (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
    return true;
  }

  return false;
}

boolean isBoardFull() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 0) {
        return false;
      }
    }
  }
  return true;
}
