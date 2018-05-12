class Cell {
  int x, y;
  color clr = color(255);
  final static int cellSize = 20;
  
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
