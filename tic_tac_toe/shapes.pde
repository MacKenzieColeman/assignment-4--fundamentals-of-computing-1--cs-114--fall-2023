void drawCircle(float x, float y) {
  ellipse(x, y, 160, 160);
}

void drawCross(float x, float y, float size) {
  line(x - size, y - size, x + size, y + size);
  line(x + size, y - size, x - size, y + size);
}
