
LangtonsAnt ant;

void setup() {
  size(900, 900, P2D);
  //fullScreen(P2D);
  ant = new LangtonsAnt();
  //noLoop();
  //frameRate(15);
  noStroke();
}


void draw() {
  background(255);
  //for (int i = 0; i < 20; ++i)
  ant.update();
  ant.show();
  ant.drawAnt();
}



class LangtonsAnt {
  Cell[][] cells;
  int rows;
  int cols;
  int cellSize = Cell.cellSize;

  int direction;
  int pos_x;
  int pos_y;

  final int ANTUP = 0;
  final int ANTRIGHT = 1;
  final int ANTDOWN = 2;
  final int ANTLEFT = 3;

  LangtonsAnt(int pos_x_, int pos_y_) {
    pos_x = pos_x_;
    pos_y = pos_y_;

    direction = ANTRIGHT;

    rows = width / cellSize;
    cols = height / cellSize;
    
    cells = new Cell[rows][cols];

    for (int i = 0; i < rows; ++i) {
      for (int j = 0; j < cols; ++j) {
        cells[i][j] = new Cell(i * cellSize, j * cellSize);
        //cells[i][j].setColor(color(random(255)));
      }
    }
    cells[pos_y][pos_x].setColor(color(0));
  }

  LangtonsAnt() {
    this(width / (Cell.cellSize * 2), height / (Cell.cellSize * 2));
  }

  void update() {
    Cell current = cells[pos_y][pos_x];

    if (current.getColor() == color(255)) {
      current.setColor(color(0));
      rotateRight();
    } else if (current.getColor() == color(0)) {
      current.setColor(color(255));
      rotateLeft();
    }

    moveForward();
  }

  void rotateRight() {
    direction = (direction + 1) % 4;
  }

  void rotateLeft() {
    direction = (direction + 3) % 4;
  }

  void moveForward() {
    switch(direction) {
    case ANTUP:
      pos_y--;
      if (pos_y < 0)
        pos_y = rows - 1;
      break;
    case ANTLEFT:
      pos_x--;
      if (pos_x < 0)
        pos_x = cols - 1;
      break;
    case ANTDOWN:
      pos_y++;
      if (pos_y >= rows)
        pos_y = 0;
      break;
    case ANTRIGHT:
      pos_x++;
      if (pos_x >= cols)
        pos_x = 0;
      break;
    }
  }

  void show() {
    for (int i = 0; i < rows; ++i) {
      for (int j = 0; j < cols; ++j) {
        cells[i][j].show();
      }
    }
    drawAnt();
  }

  void drawAnt() {
    pushStyle();
    int x = cells[pos_y][pos_x].x;
    int y = cells[pos_y][pos_x].y;
    //println(x, y);
    fill(255, 0, 0);
    rect(x, y, cellSize, cellSize);
    popStyle();
  }
}
