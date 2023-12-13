void setup() {
  size(500, 500);
  initializeBoard();
  println("Welcome to Tic-Tac-Toe.");
  println("Press 0-8 to make a move.");
  println("Computer starts...");
  computerMove();
}

void draw() {
  background(255);
  drawBoard();
}

void keyPressed() {
  if (!gameOver && key >= '0' && key <= '8') {
    int index = key - '0';
    processMove(index);
  } else {
    println("Invalid key! Press 0-8 to make a move.");
  }
}
