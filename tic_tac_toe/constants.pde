int[][] board;
boolean userTurn;
boolean gameOver;

void initializeBoard() {
  board = new int[3][3];
  userTurn = false;
  gameOver = false;

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = 0;
    }
  }
}
