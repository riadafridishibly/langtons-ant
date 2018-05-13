class Cell {
  private int x, y;
  private color clr = color(255);

  final public static int cellSize = 50;

  Cell(int x_, int y_) {
    this.x = x_;
    this.y = y_;
  }

  void show() {
    pushStyle();
    fill(clr);
    rect(x, y, cellSize, cellSize);
    popStyle();
  }

  color getColor() {
    return clr;
  }

  void setColor(color c) {
    clr = c;
  }
};
